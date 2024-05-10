//
//  FirestoreQueries.swift
//  courses
//
//  Created by Ayaan on 2023-12-27.
//

import Foundation
import Firebase
import FirebaseFirestore

class CourseData: ObservableObject {
    @Published var Courses: [Course] = UserDefaults.standard.value(forKey: "courseData") as? [Course] ?? []
    @Published var Events: [Event] = UserDefaults.standard.value(forKey: "eventData") as? [Event] ?? []
    @Published var onlineCourses: [Meeting] = []

    
    let db = Firestore.firestore()
    
    func getDate() -> Int {
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd"
        
        let result = Int(formatter.string(from: date)) ?? 0
        
        
        return result
        
    }
    
    func fetchDateFromLastLogin() -> Int {
        return Int(UserDefaults.standard.value(forKey: "lastLogin") as? String ?? "0") ?? 0
    }
    
    func fetchCourses() {
        let memoryDate = fetchDateFromLastLogin()
        let currentDate = getDate()
        
        if memoryDate != currentDate {
            UserDefaults.standard.set(currentDate, forKey: "lastLogin")
            getCourses()
            UserDefaults.standard.set(self.Courses, forKey: "courseData")
        }
    }
    
    func addEvent(meeting: Meeting, code: String) {
        for timing in meeting.timings {
            let day = timing.prefix(2)
            let strippedTime = timing.dropFirst(3)
            let arr = strippedTime.split(separator: "-")
            print(arr)
            
            if arr != [] {
                let start = Int(arr[0].dropFirst(1).dropLast(3))!
                let end = Int(arr[1].dropLast(3))!
                let event = Event(id: Int(Date().timeIntervalSince1970),startDate: start, endDate: end, title: "\(meeting.course_code)\n\(meeting.meeting)", day: String(day), session: meeting.session)
                self.Events.append(event)
            } else {
                self.onlineCourses.append(meeting)
                print(self.onlineCourses)
            }
            
        }
        
//        UserDefaults.standard.set(self.Events, forKey: "eventData")
        
    }
    
    
    func checkEventInSchedule(code: String) -> Bool {
        if self.Events.contains(where: {
            $0.title == code
        }) || self.onlineCourses.contains(where: {
            "\($0.course_code)\n\($0.meeting)" == code
        }) {
            return true
        } else {
            return false
        }
            
    }
    
    
    func removeEvent(code: String) {
        self.Events.removeAll(where: {$0.title == code})
        self.onlineCourses.removeAll(where: {"\($0.course_code)\n\($0.meeting)" == code})
    }
    
    
    func getCourses() {
        print("IN FUNCTION")
        let docRef = db.collection("courses")
        
        docRef
            .getDocuments() { (querySnapshot, err ) in
                if let err = err {
                    print("Error getting doc: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                    
                            do {
                                self.Courses.append(try document.data(as: Course.self))
                                
                            }
                            catch {
                                print("There was an error decoding: \(document.data())")
                            }
                        
                        
                    }
                }
            }
        
        
        
    }
       
}
