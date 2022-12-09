//
//  Mailer.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 05.12.2022.
//

import UIKit
import MessageUI

class Mailer {
    func checkIfEmailFilled (email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
