//
//  MeetingListItem.swift
//  courses
//
//  Created by Ayaan on 2023-12-28.
//

import SwiftUI

struct MeetingListItem: View {
    @State var lecture: Meeting
    @EnvironmentObject var CourseData: CourseData

    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(lecture.meeting)
                    .font(.headline)
                Text(lecture.instructor)
                    .font(.subheadline)
                
            }
            
            Text(lecture.mode)
                .font(.caption2)
            
            HStack {
                Text("\(lecture.enrollment) / \(lecture.class_size)")
                    .foregroundColor(lecture.enrollment<lecture.class_size ? .green : .red)
                Spacer()
                Image(systemName: !CourseData.checkEventInSchedule(code: "\(lecture.course_code)\n\(lecture.meeting)") ? "plus.circle.fill" : "minus.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(!CourseData.checkEventInSchedule(code: "\(lecture.course_code)\n\(lecture.meeting)") ? .green : .red)
                    .onTapGesture {
                        let code = "\(lecture.course_code)\n\(lecture.meeting)"
                        if  !CourseData.checkEventInSchedule(code: code) {
                            DispatchQueue.main.async {
                                CourseData.addEvent(meeting: lecture, code: code)
                            }
                           
                        } else {
                            DispatchQueue.main.async {
                                CourseData.removeEvent(code: code)
                            }
                            
                        }
                        
                    }
                
            }
            
            if lecture.timings != [] {
                Text("\(lecture.timings.joined(separator: "\n"))")
                    .font(.subheadline)
            }
            
        }
    }
}

//struct MeetingListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        MeetingListItem()
//    }
//}
