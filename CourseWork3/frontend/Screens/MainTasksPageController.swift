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
        static let profilePic : UIImage? = UIImage(named: "rabbit")
        static let bigSpacing: Double = 25
        static let spacing: Double = 15
        static let tapsNum: Int = 1
        static let offset: Double = 0
        static let picWH: Double = 75
        static let multiline: Int = 0
    }
    
    // MARK: - Fields
    private let name = UILabel()
    private let profilePic = UIImageView(image: Constants.profilePic)
    private let taskTitle = UILabel()
    private let filter = UIButton()
    private let scroll = UIScrollView()
    private let tasksSV = UIStackView()
    private let taskFilterSV = UIStackView()
    private let profileSV = UIStackView()
    
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
        for view in [profileSV, taskFilterSV, scroll] {
            self.view.addSubview(view)
        }
        
        view.backgroundColor = .white
        setupName()
        setupImage()
        setupProfileSV()
        setupTaskLabel()
        setupTaskSV()
        setupTasksSV()
        setupScroll()
        setupConstaints()
    }
    
    private func setupName() {
        name.text = "Yana Barbashina"
        name.font = UIFont.dl.ralewayBold(20)
        name.numberOfLines = Constants.multiline
        name.textColor = .black
    }
    
    private func setupImage() {
        profilePic.setWidth(Constants.picWH)
        profilePic.pinHeight(to: profilePic.widthAnchor)
    }
    
    private func setupProfileSV(){
        profileSV.addArrangedSubview(name)
        profileSV.addArrangedSubview(profilePic)
        profileSV.axis = .horizontal
        profileSV.spacing = Constants.bigSpacing
    }
    
    private func setupConstaints() {
        profileSV.pinTop(to: view.topAnchor, 60)
        profileSV.pinHorizontal(to: view, Grid.stripe)
        
        taskFilterSV.pinTop(to: profileSV.bottomAnchor, Constants.spacing)
        taskFilterSV.pinLeft(to: view, Grid.stripe)
        
        scroll.pinTop(to: taskFilterSV.bottomAnchor, Constants.bigSpacing)
        scroll.pinHorizontal(to: view, Grid.stripe)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    private func setupTaskLabel() {
        taskTitle.text = "tasks"
        taskTitle.textColor = .black
        taskTitle.font = UIFont.dl.ralewayBold(20)
        filter.setImage(UIImage(named: "filter"), for: .normal)
        filter.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
    }
    
    private func setupTaskSV() {
        for view in [taskTitle, filter] {
            taskFilterSV.addArrangedSubview(view)
        }
        
        taskFilterSV.axis = .horizontal
        taskFilterSV.spacing = Constants.spacing
    }
    
    private func getTask() -> TaskComponent {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(taskTapped))
        gesture.numberOfTapsRequired = Constants.tapsNum
        
        let selfTask = Bool.random()
        let taskView = TaskComponent(isSelfTask: selfTask)
        taskView.isUserInteractionEnabled = true
        taskView.addGestureRecognizer(gesture)
        return taskView
    }
    
    private func setupTasksSV() {
        for view in [getTask(), getTask( ), getTask(), getTask(), getTask()] {
            tasksSV.addArrangedSubview(view)
        }
        
        tasksSV.spacing = Constants.bigSpacing
        tasksSV.axis = .vertical
    }
    
    private func setupScroll() {
        scroll.addSubview(tasksSV)
        tasksSV.pinTop(to: scroll.topAnchor)
        tasksSV.pinWidth(to: scroll.widthAnchor)
        tasksSV.pinBottom(to: scroll.bottomAnchor, Constants.bigSpacing)
        scroll.clipsToBounds = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.delegate = self
    }
    
    // MARK: - Actions
    @objc
    func filterTapped() {
        let filterController = FilterPageController()
        self.navigationController?.pushViewController(filterController, animated: true)
    }
    
    @objc
    private func taskTapped(sender: TaskComponent) {
        let taskPageController = TaskPageController()
        self.navigationController?.pushViewController(taskPageController, animated: true)
    }
}
