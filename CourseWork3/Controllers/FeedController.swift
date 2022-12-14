//
//  FeedController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class FeedController: UIViewController {
    let developmentComponent = DevelopmentComponent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(developmentComponent)
        developmentComponent.pinCenter(to: view)
    }
}
