//
//  TaskPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class TaskPageController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let nfyImg: UIImage? = UIImage(named: "notification")
        static let spacing: Double = 17
        static let scrollHeight: Double = 40
        static let multiline: Int = 0
        static let linesSpacing: Double = 6
    }
    
    // MARK: - Fields
    private let task = Task()
    private let friend = FriendAccountSVConponent()
    private let groupsScroll = BubblesScrollView(type: .filled)
    private let deleteButton = BubbleView(text: "delete task")
    
    private let buttonsSV = UIStackView()
    private let notifyBtn = UIButton()
    private let dateTime = UILabel()
    private let taskName = UILabel()
    private let taskDesc = UILabel()
    
    // MARK: - Load
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidLoad()
        configureUI()
        setupNavBar(title: "Task", right: buttonsSV, color: UIColor.dl.mainCol()!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .white
                
        for view in [friend, dateTime, groupsScroll, taskName, taskDesc] {
            self.view.addSubview(view)
        }
        
        configureNotifyBtn()
        configureButtonsSV()
        configureDateTime()
        configureTaskName()
        configureTaskDesc()
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        taskDesc.pinHorizontal(to: view, Grid.stripe)
        taskDesc.pinTop(to: taskName.bottomAnchor, Constants.spacing * 2)
        
        taskName.pinTop(to: groupsScroll.bottomAnchor, Constants.spacing)
        taskName.pinHorizontal(to: view, Grid.stripe)
        
        groupsScroll.pinHorizontal(to: view, Grid.stripe)
        groupsScroll.pinTop(to: friend.bottomAnchor, Constants.spacing)
        groupsScroll.setHeight(Constants.scrollHeight)
        
        dateTime.pinCenterY(to: friend.centerYAnchor)
        dateTime.pinRight(to: view, Grid.stripe)
        
        friend.pinLeft(to: view, Grid.stripe)
        friend.pinRight(to: dateTime)
        friend.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.spacing)
    }
    
    private func configureNotifyBtn() {
        notifyBtn.setImage(Constants.nfyImg, for: .normal)
    }
    
    private func configureButtonsSV() {
        buttonsSV.axis = .horizontal
        buttonsSV.spacing = Constants.spacing
        
        for view in [deleteButton, notifyBtn] {
            buttonsSV.addArrangedSubview(view)
        }
    }
    
    private func configureTaskDesc() {
        taskDesc.numberOfLines = Constants.multiline
        taskDesc.font = UIFont.dl.ralewayMedium(16)
        taskDesc.textColor = .black
        
        let attributedString = NSMutableAttributedString(string: task.description)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = Constants.linesSpacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        taskDesc.attributedText = attributedString
    }
    
    private func configureTaskName() {
        taskName.text = task.name
        taskName.textColor = .black
        taskName.numberOfLines = Constants.multiline
        taskName.font = UIFont.dl.ralewayBold(23)
    }
    
    private func configureDateTime() {
        dateTime.text = task.deadline
        dateTime.textColor = .black
        dateTime.font = dateTime.font.withSize(14)
    }
    
    
    // MARK: - Setters
    public func setTask(title: String, desc: String, date: String) {
        taskName.text = title
        taskDesc.text = desc
        dateTime.text = date
    }
}
