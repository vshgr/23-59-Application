//
//  AddTaskGroupButtonsView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 14.12.2022.
//

import UIKit

class AddTaskGroupButtonsView: UIStackView {
    // MARK: - Constants
    enum Constants{
        static let weight: Double = 133
        static let imagePadding: Double = 8.33
        static let circleWeight: Double = 56
        static let shadowRadius: Double = 5
        static let shadowOpacity: Float = 0.3
    }
    
    // MARK: - Fields
    private var addTaskGroupButton = UIButton()
    private var closeTaskGroupButton = UIButton()
    private var addTaskGroupButtonConfig = UIButton.Configuration.plain()
    private let addTaskButton = ButtonView(title: "Add task", height: 40)
    private let addGroupButton = ButtonView(title: "Add group", height: 40)
    private var config = UIButton.Configuration.plain()
    var addTaskClicked: (() -> Void)?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*,unavailable)
    required init(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configurations
    private func configureUI() {
        axis = .vertical
        alignment = .trailing
        spacing = CommonConstants.horizontalStackSpacing
        
        for view in [addTaskButton, addGroupButton, addTaskGroupButton, closeTaskGroupButton] {
            addArrangedSubview(view)
        }
        
        configureButton(button: addTaskGroupButton, image: UIImage(named: "add") ?? UIImage.add)
        configureButton(button: closeTaskGroupButton, image: UIImage(named: "close") ?? UIImage.remove)
        
        configureActionButtons()
        configureTargets()
        closePopup()
    }
    
    private func configureTargets() {
        addTaskGroupButton.addTarget(self, action: #selector(openPopup), for: .touchUpInside)
        closeTaskGroupButton.addTarget(self, action: #selector(closePopup), for: .touchUpInside)
        addTaskButton.addTarget(self, action: #selector(addTaskPressed), for: .touchUpInside)
    }
    
    private func configureActionButtons() {
        addTaskButton.setWidth(Constants.weight)
        addGroupButton.setWidth(Constants.weight)
    }
    
    private func configureButton(button: UIButton, image: UIImage) {
        config.contentInsets = .zero
        config.image = image
        config.imagePadding = Constants.imagePadding
        
        button.backgroundColor = .black
        button.layer.cornerRadius = Constants.circleWeight / 2
        button.layer.shadowOpacity = Constants.shadowOpacity
        button.layer.shadowRadius = Constants.shadowRadius
        button.setHeight(Constants.circleWeight)
        button.pinWidth(to: button.heightAnchor)
        button.configuration = config
    }
    
    // MARK: - Actions
    @objc
    func openPopup() {
        addTaskGroupButton.showAnimation { [self] in
            self.addTaskGroupButton.isHidden = true
            self.addTaskButton.isHidden = false
            self.addGroupButton.isHidden = false
            self.closeTaskGroupButton.isHidden = false
        }
    }

    @objc
    func closePopup() {
        closeTaskGroupButton.showAnimation { [self] in
            self.addTaskGroupButton.isHidden = false
            self.addTaskButton.isHidden = true
            self.addGroupButton.isHidden = true
            self.closeTaskGroupButton.isHidden = true
        }
    }
    
    @objc
    func addTaskPressed() {
        addTaskButton.showAnimation { [self] in
            addTaskClicked?()
        }
    }
}
