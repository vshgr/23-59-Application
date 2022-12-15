//
//  CreateTaskContentStackView.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 15.12.2022.
//

import UIKit

class CreateTaskContentStackView: UIStackView {
    
    // MARK: - Constants
    enum Constants {
        static let contentSpacing: Double = 25
        static let descSpacing: Double = 14
        static let basicFont: UIFont? = UIFont.dl.ralewayMedium(14)
        static let descriptionLabelText: String = "Description"
    }
    
    // MARK: - Fields
    private let taskTitle: InputFieldView = InputFieldView(title: "Title", hint: "enter task name", message: "required")
    private var taskDate: InputFieldView = InputFieldView(title: "Deadline date", hint: "3 Dec, 2022", message: "required")
    private let taskTime: InputFieldView = InputFieldView(title: "Time", hint: "23:59", message: "required")
    private let descStack = UIStackView()
    private let descriptionField = DescriptionFieldView()
    private let descriptionLabel = UILabel()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    init(frame: CGRect = .zero, size: Double) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        configureDescriptionLabel()
        configureDescStack()
        configureContentStack()
    }
    
    private func configureContentStack() {
        axis = .vertical
        spacing = Constants.contentSpacing
        
        for view in [taskTitle, descStack, taskDate, taskTime] {
            addArrangedSubview(view)
        }
    }
    
    private func configureDescStack() {
        descStack.axis = .vertical
        descStack.spacing = Constants.descSpacing
        
        for view in [descriptionLabel, descriptionField] {
            descStack.addArrangedSubview(view)
        }
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.text = Constants.descriptionLabelText
        descriptionLabel.font = Constants.basicFont
        descriptionLabel.textColor = .black
    }
    
    // MARK: - Getter
    
    func getTastTitleText() -> String {
        return taskTitle.getText()
    }
    
    func setTaskTitleErrorState() {
        taskTitle.setErrorState()
    }
    
    func setTaskTitleDefaultState() {
        taskTitle.setDefaultState()
    }
}
