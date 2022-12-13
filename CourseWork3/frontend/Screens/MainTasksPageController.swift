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
    private let user = User(name: "Yana Barbashina",
                            username: "yana_wishnya",
                            email: "yana_wishnya@hse.ru",
                            profilePicUrl: "dog")
    private let name = UILabel()
    private let username = UILabel()
    private let nameStack = UIStackView()
    private var profilePic = UIImageView()
    private let taskTitle = UILabel()
    private let filter = UIButton()
    private let scroll = UIScrollView()
    private let tasksSV = UIStackView()
    private let taskFilterSV = UIStackView()
    private let profileSV = UIStackView()
    
    // Right bottom popup okaaaay letsgoooo
    private var addTaskGroupButton = UIButton()
    private var closeTaskGroupButton = UIButton()
    private var addTaskGroupButtonConfig = UIButton.Configuration.plain()
    private let addTaskButton = CustomButton(title: "Add task", height: 40)
    private let addGroupButton = CustomButton(title: "Add group", height: 40)
    
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
        for view in [profileSV, taskFilterSV, scroll, addTaskGroupButton,
                     closeTaskGroupButton, addTaskButton, addGroupButton] {
            self.view.addSubview(view)
        }
        
        view.backgroundColor = .white
        setupName()
        setupUsername()
        setupNameStack()
        setupImage()
        setupProfileSV()
        setupTaskLabel()
        setupFloatingButton()
        setupTaskSV()
        setupTasksSV()
        setupScroll()
        setupConstaints()
    }
    
    private func setupFloatingButton() {
        addTaskGroupButton = setupOpenCloseButtons(button: addTaskGroupButton, imageName: "add")
        addTaskGroupButton.addTarget(self, action: #selector(openPopup), for: .touchUpInside)
        
        closeTaskGroupButton = setupOpenCloseButtons(button: closeTaskGroupButton, imageName: "close")
        closeTaskGroupButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        
        setupAddTaskButton()
        setupAddGroupButton()
        
        addTaskButton.isHidden = true
        addGroupButton.isHidden = true
        closeTaskGroupButton.isHidden = true
    }
    
    private func setupOpenCloseButtons(button: UIButton, imageName: String) -> UIButton {
        button.configuration = getConfig(color: UIColor.white, imageName: imageName)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 5
        button.setHeight(40)
        button.setWidth(40)
        
        return button
    }
    
    private func getConfig(color: UIColor, imageName: String) -> UIButton.Configuration {
        addTaskGroupButtonConfig.contentInsets = .zero
        addTaskGroupButtonConfig.image = UIImage(named: imageName)?.withTintColor(color)
        addTaskGroupButtonConfig.imagePadding = Constants.imagePadding
        return addTaskGroupButtonConfig
    }
    
    private func setupAddTaskButton() {
        addTaskButton.pinRight(to: view.trailingAnchor, Grid.stripe)
        addTaskButton.pinBottom(to: addGroupButton.topAnchor, 12)
        addTaskButton.setWidth(133)
    }
    
    private func setupAddGroupButton() {
        addGroupButton.pinRight(to: view.trailingAnchor, Grid.stripe)
        addGroupButton.pinBottom(to: addTaskGroupButton.topAnchor, 15)
        addGroupButton.setWidth(133)
    }
    
    private func setupName() {
        name.text = user.name
        name.font = UIFont.dl.ralewayBold(20)
        name.numberOfLines = Constants.multiline
        name.textColor = .black
    }
    
    private func setupImage() {
        profilePic = UIImageView(image: UIImage(named: user.profilePicUrl))
        profilePic.setWidth(Constants.picWH)
        profilePic.pinHeight(to: profilePic.widthAnchor)
    }
    
    private func setupUsername() {
        username.textColor = .black
        username.text = "@" + user.username
        username.font = username.font.withSize(14)
    }
    
    private func setupNameStack() {
        nameStack.axis = .vertical
        nameStack.addArrangedSubview(name)
        nameStack.addArrangedSubview(username)
        nameStack.alignment = .leading
    }
    
    private func setupProfileSV(){
        profileSV.addArrangedSubview(nameStack)
        profileSV.addArrangedSubview(profilePic)
        profileSV.axis = .horizontal
        profileSV.alignment = .center
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
        
        for button in [addTaskGroupButton, closeTaskGroupButton] {
            button.pinRight(to: view.trailingAnchor, 21)
            button.pinBottom(to: view.bottomAnchor, 20)
        }
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
    
    private func getTask() -> TaskComponent {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(taskTapped(sender:)))
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
//        taskPageController.setTask(title: sender.getTitle(), desc: sender.getDesc(), date: sender.getDate())
        self.navigationController?.pushViewController(taskPageController, animated: true)
    }
    
    @objc
    private func openPopup() {
        addTaskGroupButton.isHidden = true
        closeTaskGroupButton.isHidden = false
        addTaskButton.isHidden = false
        addGroupButton.isHidden = false
    }
    
    @objc
    private func closePopup() {
        closeTaskGroupButton.isHidden = true
        addTaskButton.isHidden = true
        addGroupButton.isHidden = true
        addTaskGroupButton.isHidden = false
    }
}
