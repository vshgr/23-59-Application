//
//  UITextField+Borders.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 06.12.2022.
//

import UIKit

extension UIView {
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
