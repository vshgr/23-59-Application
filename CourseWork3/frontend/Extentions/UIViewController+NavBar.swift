//
//  UIViewController+NavBar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 10.12.2022.
//

import UIKit

extension UIViewController {
    func setupNavBar (title: String = "", rightComponents: UIView = UIView(), hideBack: Bool = false, color: UIColor = .clear) {
        self.title = title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightComponents)
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back_svg")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back_svg")
        navigationItem.setHidesBackButton(hideBack, animated: true)
    }
}
