//
//  NewTaskSecondPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//

import UIKit

class NewTaskSecondPageController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let contentSpacing: Double = 15
        static let spacing: Double = 17
        static let imagePadding: Double = 10
        static let bigSpacing: Double = 25
        static let fieldSpacing: Double = 14
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
    }
    
    // MARK: - Fields
    private let linkField: InputFieldView = InputFieldView(title: "Link", hint: "url")
    private let createButton = ButtonView(title: "Create task")
    private let groupsScroll = BubblesScrollView(isInteractable: true)
    
    private let groupsLabel = UILabel()
    private let groupsStack = UIStackView()

    private let visibilityStack = UIStackView()
    private let repeatButton = ButtonWithArrowView(title: "Repeat")
    private var config = UIButton.Configuration.plain()
    
    private let contentStack = UIStackView()
    
    // MARK: -  ViewLoads
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        configureUI()
        setupNavBar(title: "New task", color: UIColor.dl.mainCol() ?? .white)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Configurations
    private func configureUI() {
        view.backgroundColor = .white
        
        for view in [contentStack, createButton] {
            self.view.addSubview(view)
        }
        
        configureGroupsLabel()
        configureGroupsStack()
        configureRepeatButton()
        configureCreateButton()
        configureContentStack()
        configureConstraints()
    }
    
    private func configureRepeatButton() {
        repeatButton.buttonClicked = repeatsButtonPressed
    }
    
    private func getConfig() -> UIButton.Configuration {
        config.title = "Repeat"
        config.contentInsets = .zero
        
        config.baseForegroundColor = .black
        config.image = UIImage(named: "arrow_right")
        
        config.imagePlacement = .trailing
        config.imagePadding = Constants.imagePadding
        
        return config
    }
    
    private func configureGroupsLabel() {
        groupsLabel.text = "Groups"
        groupsLabel.font = UIFont.dl.ralewayMedium(14)
        groupsLabel.textColor = .black
    }
    
    private func configureGroupsStack() {
        groupsStack.axis = .vertical
        groupsStack.spacing = Constants.fieldSpacing
        
        for view in [groupsLabel, groupsScroll] {
            groupsStack.addArrangedSubview(view)
        }
        
        groupsScroll.pinHorizontal(to: groupsStack)
    }
    
    
    private func configureContentStack() {
        contentStack.axis = .vertical
        contentStack.spacing = Constants.bigSpacing
        contentStack.alignment = .leading
        
        for view in [linkField, groupsStack, repeatButton] {
            contentStack.addArrangedSubview(view)
        }
        
        linkField.pinHorizontal(to: contentStack)
        groupsStack.pinHorizontal(to: contentStack)
    }
    
    private func configureConstraints() {
        contentStack.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.spacing)
        contentStack.pinHorizontal(to: view, Grid.stripe)
        
        createButton.pinHorizontal(to: view, Grid.stripe * 2)
        createButton.pinBottom(to: view, Grid.stripe * 2)
    }
    
    private func configureCreateButton() {
        createButton.buttonClicked = continueButtonPressed
    }
    
    // MARK: - Actions
    @objc
    func continueButtonPressed() {
        createButton.showAnimation {
            let mainControlle = MainTasksPageController()
            self.navigationController?.pushViewController(mainControlle, animated: true)
        }
    }
    
    @objc
    func repeatsButtonPressed() {
        repeatButton.showAnimation {
            
        }
        
    }
}
