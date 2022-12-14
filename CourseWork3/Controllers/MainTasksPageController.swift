//
//  MainTasksPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class MainTasksPageController: UIViewController, UIScrollViewDelegate {
    // MARK: - Constants
    enum Constants {
        static let bigSpacing: Double = 25
        static let spacing: Double = 15
        static let tapsNum: Int = 1
        static let offset: Double = 0
        static let picWH: Double = 75
        static let multiline: Int = 0
        static let filter: UIImage? = UIImage(named: "filter")
        static let title: String = "tasks"
    }
    
    // MARK: - Fields
    private let profileInfo = ProfileInfoView()
    private var addTaskPopup = AddTaskGroupButtonsView()
    private let scrollView = TasksScrollView()
    private let taskTitle = UILabel()
    private let filter = UIButton()
    private let taskFilterSV = UIStackView()

    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != Constants.offset {
            scrollView.contentOffset.x = Constants.offset
        }
    }
    
    // MARK: - Setups
    private func setupView() {
        for view in [profileInfo, taskFilterSV, scrollView, addTaskPopup] {
            self.view.addSubview(view)
        }
        
        view.backgroundColor = .white
        setupTaskLabel()
        setupTaskClick()
        setupTaskSV()
        setupAddTaskButton()
        setupConstaints()
    }
    
    private func setupAddTaskButton() {
        addTaskPopup.addTaskClicked = addNewTask
    }
    
    private func setupTaskClick() {
        scrollView.open = taskTapped
    }
    
    private func setupConstaints() {
        profileInfo.pinTop(to: view.topAnchor, 60)
        profileInfo.pinHorizontal(to: view, Grid.stripe)
        
        taskFilterSV.pinTop(to: profileInfo.bottomAnchor, Constants.spacing)
        taskFilterSV.pinLeft(to: view, Grid.stripe)
        
        scrollView.pinTop(to: taskFilterSV.bottomAnchor, Constants.bigSpacing)
        scrollView.pinHorizontal(to: view, Grid.stripe)
        scrollView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        
        addTaskPopup.pinRight(to: view.trailingAnchor, Grid.stripe)
        addTaskPopup.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Grid.stripe)
    }
    
    private func setupTaskLabel() {
        taskTitle.text = Constants.title
        taskTitle.textColor = .black
        taskTitle.font = UIFont.dl.ralewayBold(20)
        filter.setImage(Constants.filter, for: .normal)
        filter.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
    }
    
    private func setupTaskSV() {
        for view in [taskTitle, filter] {
            taskFilterSV.addArrangedSubview(view)
        }
        
        taskFilterSV.axis = .horizontal
        taskFilterSV.spacing = Constants.spacing
    }
    
    
    // MARK: - Actions
    @objc
    func filterTapped() {
        let filterController = FilterPageController()
        self.navigationController?.pushViewController(filterController, animated: true)
    }
    
    @objc
    private func taskTapped() {
        let taskPageController = TaskPageController()
        self.navigationController?.pushViewController(taskPageController, animated: true)
    }
    
    @objc
    func addNewTask() {
        let firstCreateTaskPage = NewTaskFirstPageController()
        self.navigationController?.pushViewController(firstCreateTaskPage, animated: true)
    }
}
