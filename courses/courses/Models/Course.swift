//
//  Course.swift
//  courses
//
//  Created by Ayaan on 2023-12-27.
//

import Foundation

struct Course: Identifiable, Codable, Hashable {
    var id: Int
    var code: String
    var lectures: [Meeting]
    var name: String
    var practicals: [Meeting]
    var session: String
    var tutorials: [Meeting]
}

struct Meeting: Identifiable, Codable, Hashable {
    var id: Int
    var class_size: Int
    var course_title: String
    var enrollment: Int
    var instructor: String
    var is_waitlist: String
    var meeting: String
    var timings: [String]
    var mode: String
    var session: String
    var course_code: String
}
