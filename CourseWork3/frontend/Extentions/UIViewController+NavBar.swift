//
//  UIViewController+NavBar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 10.12.2022.
//

import UIKit

extension UIViewController {
    func setupNavBar (title: String = "", right: UIView = UIView(), color: UIColor = .white) {
        self.title = title
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        appearance.setBackIndicatorImage(UIImage(named: "back_svg"), transitionMaskImage: UIImage(named: "back_svg"))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        let rightButtons = UIBarButtonItem(customView: right)
        navigationItem.rightBarButtonItem = rightButtons
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}
