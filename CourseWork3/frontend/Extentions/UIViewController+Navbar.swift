//
//  UIViewController+Navbar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

extension UIViewController {
    func addBackNavbarButtonToNextController() {
        let img = UIImage(named: "back_svg")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = img
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = img
        navigationController?.navigationBar.tintColor = .black
    }
    
    func setNavBarColorAndTitle(color: UIColor = .white, title: String = "") {
        navigationController?.navigationBar.backgroundColor = color
        self.title = title
    }
    
    func dismissNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
