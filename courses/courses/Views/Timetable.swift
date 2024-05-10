//
//  Timetable.swift
//  courses
//
//  Created by Ayaan Shahab on 2023-12-28.
//

import SwiftUI
import WrappingHStack

struct Event: Identifiable, Codable, Hashable {
    let id: Int
    var startDate: Int
    var endDate: Int
    var title: String
    var day: String
    var session: String
}


struct Timetable: View {
    let daysOfWeek = ["MO", "TU", "WE", "TH", "FR"]
    let session = ["Fall", "Winter", "Summer"]
    @State var selectedSession = "Fall"
    let date: Date = dateFrom(9, 5, 2023)
    let colors = [Color.orange, Color.red, Color.teal, Color.green, Color.yellow, Color.blue, Color.purple, Color.cyan]
    
    @State private var selectedDayIndex = 0
    
    @EnvironmentObject var courseData: CourseData

    
    let hourHeight = 40.0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Picker("Select", selection: $selectedSession) {
                ForEach(session, id: \.self) {
                    Text($0)
                }
            }
            
            Text("Selected Session: \(selectedSession)")
            
            Picker("Select Day", selection: $selectedDayIndex) {
                ForEach(0..<daysOfWeek.count) { index in
                    Text(self.daysOfWeek[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            VStack(alignment: .leading) {
                Text("Online")
                    .font(.headline)
                
                ForEach(courseData.onlineCourses.filter { course in
                    if course.session == selectedSession && course.meeting.starts(with: "LEC") {
                        return true
                    } else {
                        return false
                    }
                        
                }) { online in
                    Text("\(online.course_code)- \(online.meeting)")
                }
            }
            
            
            
            if self.daysOfWeek[selectedDayIndex] == "MO" {
                DaySchedule(events: courseData.Events.filter { event in
                    if event.day == "MO" && event.session == selectedSession {
                        return true
                    } else {
                        return false
                    }
                })
            }
            
            if self.daysOfWeek[selectedDayIndex] == "TU" {
                DaySchedule(events: courseData.Events.filter { event in
                    if event.day == "TU" && event.session == selectedSession{
                        return true
                    } else {
                        return false
                    }
                })
            }
            if self.daysOfWeek[selectedDayIndex] == "WE" {
                DaySchedule(events: courseData.Events.filter { event in
                    if event.day == "WE" && event.session == selectedSession{
                        return true
                    } else {
                        return false
                    }
                })
            }
            if self.daysOfWeek[selectedDayIndex] == "TH" {
                DaySchedule(events: courseData.Events.filter { event in
                    if event.day == "TH" && event.session == selectedSession {
                        return true
                    } else {
                        return false
                    }
                })
            }
            if self.daysOfWeek[selectedDayIndex] == "FR" {
                DaySchedule(events: courseData.Events.filter { event in
                    if event.day == "FR" && event.session == selectedSession {
                        return true
                    } else {
                        return false
                    }
                })
            }
            
        }
        .padding()
    }
    
}
    
struct Timetable_Previews: PreviewProvider {
    static var previews: some View {
        Timetable()
    }
}

func dateFrom(_ day: Int, _ month: Int, _ year: Int, _ hour: Int = 0, _ minute: Int = 0) -> Date {
    let calendar = Calendar.current
    let dateComponents = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute)
    return calendar.date(from: dateComponents) ?? .now
}
