//
//  UIViewController+NavBar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 10.12.2022.
//

import UIKit

extension UIViewController {
    func setupNavBar (title: String = "", right: UIView = UIView(), color: UIColor = .clear) {
        
        self.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = color
        appearance.setBackIndicatorImage(UIImage(named: "back_svg"), transitionMaskImage: UIImage(named: "back_svg"))
        
        let rightButtons = UIBarButtonItem(customView: right)
        
        navigationItem.rightBarButtonItem = rightButtons
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance


        
    }
}
