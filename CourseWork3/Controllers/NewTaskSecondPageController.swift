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
    }
    
    // MARK: - Fields
    private let linkField: InputFieldView = InputFieldView(title: "Link", hint: "url")
    private let createButton = ButtonView(title: "Create task")
    private let visibilityStack = VisibilityStackView()
    private let groupsStack = GroupsStackView()

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
    
    private func configureContentStack() {
        contentStack.axis = .vertical
        contentStack.spacing = Constants.bigSpacing
        contentStack.alignment = .leading
        
        for view in [linkField, groupsStack, visibilityStack, repeatButton] {
            contentStack.addArrangedSubview(view)
        }
        
        linkField.pinHorizontal(to: contentStack)
        groupsStack.pinHorizontal(to: contentStack)
        visibilityStack.pinHorizontal(to: contentStack)
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
        if !visibilityStack.isSomeSelected() {
            visibilityStack.setErrorState()
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                self.visibilityStack.setDefaultState()
            }
        } else {
            createButton.showAnimation {
                let tabController = CustomTabBarController()
                self.navigationController?.pushViewController(tabController, animated: true)
            }
        }
    }
    
    @objc
    func repeatsButtonPressed() {
        repeatButton.showAnimation {
            
        }
        
    }
}
