//
//  CourseSheet.swift
//  courses
//
//  Created by Ayaan Shahab on 2023-12-28.
//

import SwiftUI

struct CourseSheet: View {
    @State var course: Course
    @State var hi = false
    var body: some View {
       
            List {
                Section(header: Text("Lectures")) {
                    ForEach(course.lectures, id: \.self) {lecture in
                        MeetingListItem(lecture: lecture)
                    }
                }
                
                if course.tutorials != [] {
                    Section(header: Text("Tutorials")) {
                        ForEach(course.tutorials, id: \.self) {tutorial in
                            MeetingListItem(lecture: tutorial)
                        }
                    }
                }
                
                
                if course.practicals != [] {
                    Section(header: Text("Practicals")) {
                        ForEach(course.practicals, id: \.self) {practical in
                            MeetingListItem(lecture: practical)

                        }
                    }
                }
                
                Section(header: Text("Timetable")) {
                    Timetable(selectedSession: course.session.capitalized)
                }
                
                
                
            }
        
    }
}

//struct CourseSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseSheet(course:Course(id: 351, code: "CSCA48H3S", lectures: [courses.Meeting(id: 351, class_size: 175, course_title: "Introduction to Computer Science II", enrollment: 119, instructor: "Ponce Castro, M.", is_waitlist: "Y", meeting: "LEC01", timings: ["MO, 13:00-14:00", "TH, 10:00-12:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 175, course_title: "Introduction to Computer Science II", enrollment: 174, instructor: "Huang, Y.", is_waitlist: "Y", meeting: "LEC02", timings: ["MO, 12:00-13:00", "WE, 11:00-13:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 175, course_title: "Introduction to Computer Science II", enrollment: 145, instructor: "Huang, Y.", is_waitlist: "Y", meeting: "LEC03", timings: ["TU, 12:00-14:00", "TH, 13:00-14:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 175, course_title: "Introduction to Computer Science II", enrollment: 72, instructor: "Huang, Y.", is_waitlist: "Y", meeting: "LEC04", timings: ["TU, 10:00-12:00", "TH, 12:00-13:00"], mode: "In-person")], name: "Introduction to Computer Science II", practicals: [], session: "Winter", tutorials: [courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 33, instructor: "", is_waitlist: "N", meeting: "TUT0001", timings: ["MO, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 30, instructor: "", is_waitlist: "N", meeting: "TUT0002", timings: ["FR, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 22, instructor: "", is_waitlist: "N", meeting: "TUT0003", timings: ["FR, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 32, instructor: "", is_waitlist: "N", meeting: "TUT0004", timings: ["TH, 19:00-20:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 33, instructor: "", is_waitlist: "N", meeting: "TUT0005", timings: ["MO, 19:00-20:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 32, instructor: "", is_waitlist: "N", meeting: "TUT0006", timings: ["WE, 19:00-20:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 26, instructor: "", is_waitlist: "N", meeting: "TUT0007", timings: ["TU, 19:00-20:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 25, instructor: "", is_waitlist: "N", meeting: "TUT0008", timings: ["FR, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 31, instructor: "", is_waitlist: "N", meeting: "TUT0009", timings: ["MO, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 29, instructor: "", is_waitlist: "N", meeting: "TUT0010", timings: ["WE, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 33, instructor: "", is_waitlist: "N", meeting: "TUT0011", timings: ["TU, 15:00-16:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 32, instructor: "", is_waitlist: "N", meeting: "TUT0013", timings: ["FR, 14:00-15:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 33, instructor: "", is_waitlist: "N", meeting: "TUT0014", timings: ["WE, 10:00-11:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 28, instructor: "", is_waitlist: "N", meeting: "TUT0015", timings: ["TU, 19:00-20:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 30, course_title: "Introduction to Computer Science II", enrollment: 28, instructor: "", is_waitlist: "N", meeting: "TUT0016", timings: ["MO, 19:00-20:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 7, instructor: "", is_waitlist: "N", meeting: "TUT0017", timings: ["FR, 09:00-10:00"], mode: "In-person"), courses.Meeting(id: 351, class_size: 33, course_title: "Introduction to Computer Science II", enrollment: 25, instructor: "", is_waitlist: "N", meeting: "TUT0019", timings: ["MO, 09:00-10:00"], mode: "In-person")]))
//    }
//}
