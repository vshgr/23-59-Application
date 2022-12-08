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

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
