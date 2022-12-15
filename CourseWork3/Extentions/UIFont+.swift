//
//  UIFont+.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

extension UIFont {
    enum dl {
        private static let mainFont: String = "FONTSPRINGDEMO-PontiacBoldRegular"
        private static let ralewayRegular: String = "Raleway-Regular"
        private static let ralewayMedium: String = "Raleway-Medium"
        private static let ralewayBold: String = "Raleway-Bold"
        
        static func mainFont(_ size: CGFloat = 16) -> UIFont? {
            UIFont(name: mainFont, size: size)
        }
        
        static func ralewayRegular(_ size: CGFloat = 16) -> UIFont? {
            UIFont(name: ralewayRegular, size: size)
        }
        
        static func ralewayMedium(_ size: CGFloat = 14) -> UIFont? {
            UIFont(name: ralewayMedium, size: size)
        }
        
        static func ralewayBold(_ size: CGFloat = 20) -> UIFont? {
            UIFont(name: ralewayBold, size: size)
        }
    }
}
