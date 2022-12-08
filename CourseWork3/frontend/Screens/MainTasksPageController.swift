//
//  MainTasksPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class MainTasksPageController: UIViewController {
    private let taskView = TaskComponent(selfT: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(taskView)
        taskView.pinHorizontal(to: view, Grid.stripe)
        taskView.pinTop(to: view, 100)
    }
}
