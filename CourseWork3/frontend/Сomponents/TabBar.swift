//
//  TabBar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    let main = UIImage(named: "main")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapBar()
        configureAppearance()
    }
    
    private func configureTapBar() {
        let mainController = generateViewControllers(controller: MainTasksPageController(), title: "", image: main ?? .add)
        viewControllers = [mainController]
    }
    
    private func generateViewControllers(controller: UIViewController, title: String, image: UIImage) -> UIViewController {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        return controller
    }
    
    private func configureAppearance() {
        tabBar.barTintColor = .black
        tabBar.tintColor = UIColor.dl.mainCol()
        tabBar.unselectedItemTintColor = .white
    }
}
