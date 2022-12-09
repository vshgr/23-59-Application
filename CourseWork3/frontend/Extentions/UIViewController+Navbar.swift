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
    
    func setNavBarColorAndTitle(color: UIColor = .white.withAlphaComponent(0), title: String = "") {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.dl.ralewayBold()!]
        navigationController?.navigationBar.backgroundColor = color
        self.title = title
        
        let colouredTop = UIView()
        view.addSubview(colouredTop)
        colouredTop.translatesAutoresizingMaskIntoConstraints = false
        colouredTop.backgroundColor = color
        
        NSLayoutConstraint.activate([
            colouredTop.topAnchor.constraint(equalTo: view.topAnchor),
            colouredTop.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colouredTop.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    func dismissNavBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
