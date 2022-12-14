//
//  CheckInput.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//

import Foundation

class CheckInput {
    static func checkEmailisCorrect(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func checkUsernameIsCorrect(username: String) -> Bool {
        let usernameRegEx = "\\w{5,18}"
        let usernamePred = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: username)
    }
}
