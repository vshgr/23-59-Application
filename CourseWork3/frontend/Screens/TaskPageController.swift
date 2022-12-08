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
        static let spacing: Double = 15
        static let scrollHeight: Double = 40
        static let descText: String = "Подготовить макеты в фигме для индивидуального/командного мини-проекта по созданию мобильного приложения по курсу. Необходимо сформулировать перечень функциональных требований к программе, построить use-case-диаграмму с покрытием прецедентами всех этих требований. Продумать все возможные сценарии использования и отразить их в виде вайрфреймов с проработанными макетами экранов приложения."
        static let deadline: String = "3 Dec, 23:59"
        static let taskTitle: String = "Какое-то название задачи оно большое и при этом остается мультилайн круто да"
    }
    
    // MARK: - Fields
    private let buttonsSV = UIStackView()
    private let deleteButton = BubbleComponent(text: "delete task")
    private let notifyBtn = UIButton()
    private let friend = FriendAccountSVConponent()
    private let dateTime = UILabel()
    private let groupsSV = UIStackView()
    private let taskName = UILabel()
    private let taskDesc = UILabel()
    private let scrollGroups = UIScrollView()
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .white
        
        for view in [buttonsSV, friend, dateTime, scrollGroups, taskName, taskDesc] {
            self.view.addSubview(view)
        }
        
        configureNotifyBtn()
        configureButtonsSV()
        configureDateTime()
        configureGroups()
        configureScrollView()
        configureTaskName()
        configureTaskDesc()
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        taskDesc.pinHorizontal(to: view, Grid.stripe)
        taskDesc.pinTop(to: taskName.bottomAnchor, Constants.spacing)
        taskName.pinTop(to: scrollGroups.bottomAnchor, Constants.spacing)
        taskName.pinHorizontal(to: view, Grid.stripe)
        scrollGroups.pinHorizontal(to: view, Grid.stripe)
        scrollGroups.pinTop(to: friend.bottomAnchor, Constants.spacing)
        scrollGroups.setHeight(Constants.scrollHeight)
        dateTime.pinCenterY(to: friend.centerYAnchor)
        dateTime.pinRight(to: view, Grid.stripe)
        friend.pinLeft(to: view, Grid.stripe)
        friend.pinTop(to: buttonsSV.bottomAnchor, Constants.spacing)
        buttonsSV.pinRight(to: view, Grid.stripe)
        buttonsSV.pinTop(to: view, Constants.spacing)
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
        taskDesc.text = Constants.descText
        taskDesc.numberOfLines = 0
        taskDesc.font = UIFont.dl.ralewayMedium(14)
        taskDesc.textColor = .black
    }
    
    private func configureTaskName() {
        taskName.text = Constants.taskTitle
        taskName.textColor = .black
        taskName.numberOfLines = 0
        taskName.font = UIFont.dl.ralewayBold(20)
    }
    
    private func configureDateTime() {
        dateTime.text = Constants.deadline
        dateTime.textColor = .black
        dateTime.font = dateTime.font.withSize(12)
    }
    
    private func getGroup(title: String) -> UIView {
        let group = BubbleComponent(text: title)
        group.backgroundColor = UIColor.dl.mainCol()
        group.setBorder(width: 0, color: .white)
        return group
    }
    
    private func configureScrollView() {
        scrollGroups.addSubview(groupsSV)
        scrollGroups.clipsToBounds = false
        scrollGroups.showsHorizontalScrollIndicator = false
        scrollGroups.showsVerticalScrollIndicator = false
        
        groupsSV.pin(to: scrollGroups)
    }
    
    private func configureGroups() {
        let fb = getGroup(title: "курсовая работа")
        let sb = getGroup(title: "диплом")
        let tb = getGroup(title: "организация вечеринки")
        let ftb = getGroup(title: "работа")
        
        for view in [fb, sb, tb, ftb]{
            groupsSV.addArrangedSubview(view)
        }
        
        groupsSV.axis = .horizontal
        groupsSV.spacing = Constants.spacing - 5
    }
}
