//
//  TabBar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    let main = UIImage(named: "main")
    let feed = UIImage(named: "feed")
    let friends = UIImage(named: "friends")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapBar()
        configureAppearance()
        setupNavBar()
    }
    
    private func configureTapBar() {
        let mainController = generateViewControllers(controller: MainTasksPageController(), title: "", image: main ?? .add)
        let feedController = generateViewControllers(controller: FeedController(), title: "", image: feed  ?? .add)
        let friendsController = generateViewControllers(controller: FriendsController(), title: "", image: friends  ?? .add)
        viewControllers = [feedController, mainController, friendsController]
    }
    
    private func generateViewControllers(controller: UIViewController, title: String, image: UIImage) -> UIViewController {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        return controller
    }
    
    private func configureAppearance() {
        tabBar.tintColor = UIColor.dl.mainCol()
        tabBar.unselectedItemTintColor = .white
        tabBar.barTintColor = .purple
        tabBar.isTranslucent = false
    }
}
