//
//  FeedController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class FilterPageController: UIViewController {
    let developmentComponent = DevelopmentComponent()
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidLoad()
        setupView()
        setupNavBar(title: "Filters", color: UIColor.dl.mainCol()!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(developmentComponent)
        developmentComponent.pinCenter(to: view)
    }
}
