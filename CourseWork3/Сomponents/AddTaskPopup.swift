//
//  AddTaskPopup.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 13.12.2022.
//

import UIKit

class AddTaskPopup : UIView {
    // MARK: - Constants
    private enum Constants {
        static let errorMessage: String = "init(coder:) has not been implemented"
        static let cornerRaduis: CGFloat = 20
        static let imagePadding: Double = 8.33
    }
    
    // MARK: - Fields
    private let addTaskButton = CustomButton(title: "Add task", height: 40)
    private let addGroupButton = CustomButton(title: "Add group", height: 40)
    
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.errorMessage)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        addSubview(addTaskButton)
        addSubview(addGroupButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        addTaskButton.pinTop(to: self)
        addGroupButton.pinTop(to: addTaskButton.bottomAnchor, 12)
    }
}

class AddTaskPopupController: UIViewController {
    // MARK: - Fields
    private let addTask = AddTaskPopup()
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
        view = addTask
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
