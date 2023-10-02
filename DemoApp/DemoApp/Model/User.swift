//
//  User.swift
//  DemoApp
//
//

import Foundation

struct User : Codable,Identifiable {
    var id = UUID().uuidString
    var name: String = ""
    var lastName: String = ""
    var number:String = ""
    var email: String = ""
}
