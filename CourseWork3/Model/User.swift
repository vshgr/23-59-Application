//
//  User.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 05.12.2022.
//


struct User {
    var name: String
    var username: String
    var email: String
    var profilePicUrl: String
}

extension User {
    init() {
        name = "Yana Barbashina"
        username = "yana_wishnya"
        email = "yana_wishnya@hse.ru"
        profilePicUrl = "dog"
    }
}

