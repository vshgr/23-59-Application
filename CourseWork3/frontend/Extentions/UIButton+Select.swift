//
//  UIButton+Select.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

extension UIButton {
    func isSelected(btn: UIButton) -> Bool {
        if (btn.layer.borderWidth == 0) {
            return false
        }
        return true
    }
}
