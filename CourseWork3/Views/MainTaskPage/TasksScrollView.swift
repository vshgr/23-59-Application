//
//  TasksScrollView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 14.12.2022.
//

import UIKit

class TasksScrollView: UIScrollView, UIScrollViewDelegate {
    // MARK: - Constants
    enum Constants{
        static let offset: Double = 0
    }
    
    // MARK: - Fields
    private let tasksSV = UIStackView()
    var open: (() -> Void)?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Functions
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if contentOffset.x != Constants.offset {
            contentOffset.x = Constants.offset
        }
    }
    
    private func getTask() -> TaskView {
        let selfTask = Bool.random()
        let taskView = TaskView(isSelfTask: selfTask)
        taskView.isUserInteractionEnabled = true
        taskView.taskClicked = openTask
        return taskView
    }
    
    // MARK: - Configurations
    private func configureUI() {
        clipsToBounds = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        
        configureTasksSV()
        addSubview(tasksSV)
        configureConstraints()
    }
    
    private func configureTasksSV() {
        for view in [getTask(), getTask(), getTask(), getTask(), getTask()] {
            tasksSV.addArrangedSubview(view)
        }
        
        tasksSV.spacing = CommonConstants.contentStackSpacing
        tasksSV.axis = .vertical
    }
    
    private func configureConstraints() {
        tasksSV.pinTop(to: topAnchor)
        tasksSV.pinWidth(to: widthAnchor)
        tasksSV.pinBottom(to: bottomAnchor, CommonConstants.contentStackSpacing)
    }
    
    // MARK: - Actions
    @objc
    func openTask() {
        open?()
    }
    
}
