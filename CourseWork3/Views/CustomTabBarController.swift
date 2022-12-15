//
//  TabBar.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    // MARK: - Constants
    enum Constants {
        static let main = UIImage(named: "main")
        static let feed = UIImage(named: "feed")
        static let friends = UIImage(named: "friends")
    }

    // MARK: - Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapBar()
        configureAppearance()
        self.selectedIndex = 1
        setupNavBar()
    }
    
    // MARK: - Configurations
    private func configureTapBar() {
        let mainController = generateViewControllers(controller: MainTasksPageController(), title: "", image: Constants.main ?? .add)
        let feedController = generateViewControllers(controller: FeedController(), title: "", image: Constants.feed  ?? .add)
        let friendsController = generateViewControllers(controller: FriendsController(), title: "", image: Constants.friends  ?? .add)
        viewControllers = [feedController, mainController, friendsController]
    }
    
    private func configureAppearance() {
        tabBar.tintColor = UIColor.dl.mainCol()
        tabBar.unselectedItemTintColor = .white
        tabBar.barTintColor = .purple
        tabBar.isTranslucent = false
    }
    
    // MARK: - Generation
    private func generateViewControllers(controller: UIViewController, title: String, image: UIImage) -> UIViewController {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        return controller
    }
    
}
