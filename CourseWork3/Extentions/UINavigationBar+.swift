//
//  UINavigationController+.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//

import UIKit

extension UINavigationBar {

    override open var safeAreaInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: Grid.stripe - 12, bottom: 0, right: 0)
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}


