//
//  TaskComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class TaskComponent: UIView {
    // MARK: - Fields
    private let selfTask: Bool
    private let taskView = UIView()
    private let buttonsSV = UIStackView()
    private let contentSV = UIStackView()
    private let permission = UILabel()
    private let taskName = UILabel()
    private let groups = UILabel()
    private let bottomLineSV = UIStackView()
    private let dateView = DateBubbleComponent()
    private let friend = FriendAccountSVConponent()
    
    // MARK: - Init
    init(frame: CGRect = .zero, selfT: Bool = true) {
        selfTask = selfT
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configureUI() {
        addSubview(taskView)
        
        taskView.layer.cornerRadius = 10
        taskView.backgroundColor = UIColor(rgb: 0xF8F8F8)
        
        configurePermissionLabel()
        configureTaskNameLabel()
        configureGroupsLabel()
        configureBottomLineSV()
        configureContentSV()
        
        taskView.addSubview(contentSV)
        contentSV.pinVertical(to: taskView, 15)
        contentSV.pinHorizontal(to: taskView, 15)
        
        taskView.pin(to: self)
    }
    
    private func configurePermissionLabel() {
        permission.text = "private"
        permission.textColor = UIColor.dl.hintCol()
        permission.font = UIFont.dl.ralewayMedium(12)
    }
    
    private func configureTaskNameLabel() {
        taskName.text = "Какое-то название задачи оно большое и при этом остается мультилайн круто да"
        taskName.numberOfLines = 0
        taskName.textColor = .black
        taskName.font = UIFont.dl.ralewayBold(14)
    }
    
    private func configureGroupsLabel() {
        groups.text = "Курсовая работа, Диплом, Организация вечеринки"
        groups.numberOfLines = 0
        groups.textColor = UIColor.dl.hintCol()
        groups.font = UIFont.dl.ralewayMedium(14)
    }
    
    private func configureContentSV() {
        contentSV.axis = .vertical
        contentSV.spacing = 15
        
        for view in [friend, permission, taskName, bottomLineSV] {
            contentSV.addArrangedSubview(view)
        }
        
        if (selfTask == true) {
            friend.isHidden = true
        } else {
            permission.isHidden = true
        }
    }
    
    private func configureBottomLineSV() {
        bottomLineSV.axis = .horizontal
        bottomLineSV.spacing = 15
        
        for view in [dateView, groups] {
            bottomLineSV.addArrangedSubview(view)
        }
        
    }
    
}
