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
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
    }
    
    private let linkField: InputFieldView = InputFieldView(title: "Link", hint: "url")
    
    private let createButton = ButtonView(title: "Create task")
    
    private let groupsLabel = UILabel()
    private let groupsStack = UIStackView()
    private let groupsBubblesStack = UIStackView()
    private let scrollGroups = UIScrollView()

    private let visibilityStack = UIStackView()
    private let repeatButton = ButtonWithArrowView(title: "Repeat")
    private var config = UIButton.Configuration.plain()
    
    private let contentStack = UIStackView()
    
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
    
    private func configureUI() {
        view.backgroundColor = .white
        
        
        for view in [contentStack, createButton] {
            self.view.addSubview(view)
        }
        
        configureGroupsLabel()
        configureGroupsBubblesStack()
        configureScrollGroups()
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
        groupsStack.spacing = 14
        
        for view in [groupsLabel, scrollGroups] {
            groupsStack.addArrangedSubview(view)
        }
        
        scrollGroups.pinHorizontal(to: groupsStack)
    }
    
    private func getGroup(title: String) -> UIView {
        let group = BubbleComponent(text: title)
        return group
    }
    
    private func configureGroupsBubblesStack() {
        let fb = getGroup(title: "курсовая работа")
        let sb = getGroup(title: "диплом")
        let tb = getGroup(title: "организация вечеринки")
        let ftb = getGroup(title: "работа")
        
        for view in [fb, sb, tb, ftb]{
            groupsBubblesStack.addArrangedSubview(view)
        }
        
        groupsBubblesStack.axis = .horizontal
        groupsBubblesStack.spacing = Constants.spacing - 5
    }
    
    private func configureScrollGroups() {
        scrollGroups.addSubview(groupsBubblesStack)
        scrollGroups.clipsToBounds = false
        scrollGroups.showsHorizontalScrollIndicator = false
        scrollGroups.showsVerticalScrollIndicator = false
        
        groupsBubblesStack.pin(to: scrollGroups)
        
        scrollGroups.setHeight(30)
    }
    
    private func configureContentStack() {
        contentStack.axis = .vertical
        contentStack.spacing = 25
        contentStack.alignment = .leading
        
        for view in [linkField, groupsStack, repeatButton] {
            contentStack.addArrangedSubview(view)
        }
        
        linkField.pinHorizontal(to: contentStack)
        groupsStack.pinHorizontal(to: contentStack)
    }
    
    private func configureConstraints() {
        contentStack.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 17)
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
            
        }
    }
    
    @objc
    func repeatsButtonPressed() {
        repeatButton.showAnimation {
            
        }
        
    }
}
