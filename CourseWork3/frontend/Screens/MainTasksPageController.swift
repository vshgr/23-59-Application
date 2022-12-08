//
//  MainTasksPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class MainTasksPageController: UIViewController {
    private let taskView = TaskComponent(isSelfTask: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        dismissNavBar()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(taskView)
        taskView.pinTop(to: view.topAnchor, 100)
        taskView.pinHorizontal(to: view, Grid.stripe)
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(taskTapped))
        gesture.numberOfTapsRequired = 1
        taskView.isUserInteractionEnabled = true
        taskView.addGestureRecognizer(gesture)
    }
    
    @objc
    private func taskTapped() {
        taskView.showAnimation {
            let taskPageController = TaskPageController()
            self.present(taskPageController, animated: true)
        }
    }
}
