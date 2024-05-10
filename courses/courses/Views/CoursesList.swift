//
//  CoursesList.swift
//  courses
//
//  Created by Ayaan Shahab on 2023-12-28.
//

import SwiftUI

struct CoursesList: View {
    @EnvironmentObject var courseData: CourseData
    @State private var searchText: String = ""
    @State private var searchKey: String = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if searchKey != "" {
                        ForEach(courseData.Courses.filter { $0.code.lowercased().hasPrefix(searchKey.lowercased()) }) { course in
                            CourseCard(course: course)
                        }
                    } else {
                        ForEach(courseData.Courses.prefix(100)) { course in
                            CourseCard(course: course)
                        }
                    }
                    
                    
                }
                
                
                
            }
            .navigationTitle("Courses")
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                searchKey = searchText
            }
            .onChange(of: searchText) { newValue in
                if newValue.isEmpty {
                    searchKey = ""
                }
            }
        }
        .padding()
        
    }
}

//struct CoursesList_Previews: PreviewProvider {
//    static var previews: some View {
//        CoursesList()
//    }
//}
