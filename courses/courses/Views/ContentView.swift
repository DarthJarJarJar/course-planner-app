//
//  ContentView.swift
//  courses
//
//  Created by Ayaan Shahab on 2023-12-27.
//

import SwiftUI

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct ContentView: View {
    @EnvironmentObject var courseData: CourseData
//    @State private var searchText: String = ""
//    @State private var searchKey: String = ""
    var body: some View {
        TabView {
            CoursesList()
                .tabItem {
                    Label("Courses", systemImage: "graduationcap")
                }
            Timetable()
                .tabItem {
                    Label("Timetable", systemImage: "calendar")
                }
        }
        .onAppear {
            courseData.fetchCourses()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseData())
    }
}
