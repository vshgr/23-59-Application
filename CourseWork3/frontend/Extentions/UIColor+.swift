//
//  UIFont+.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

extension UIColor {
    enum dl {
        private static let main: String = "mainColor"
        private static let attention: String = "attentionColor"
        private static let hint: String = "hintColor"
        private static let violet: String = "violet"
        
        static func mainCol() -> UIColor? {
            UIColor(named: main)
        }
        
        static func attentionCol() -> UIColor? {
            UIColor(named: attention)
        }
        
        static func hintCol() -> UIColor? {
            UIColor(named: hint)
        }
        
        static func violetCol() -> UIColor? {
            UIColor(named: violet)
        }
    }
}
