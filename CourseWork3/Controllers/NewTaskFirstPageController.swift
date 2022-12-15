//
//  NewTaskFirstPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//
import UIKit

class NewTaskFirstPageController: UIViewController {
    // MARK: - Fields
    private let contentStack = CreateTaskContentStackView()
    private let continueButon = ButtonView(title: "Continue")
    
    // MARK: - Load
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
    
    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .white
        
        for view in [contentStack, continueButon] {
            self.view.addSubview(view)
        }
        
        configureContinueButton()
        configureConstraints()
    }
    
    private func configureConstraints() {
        contentStack.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 17)
        contentStack.pinHorizontal(to: view, Grid.stripe)
        
        continueButon.pinHorizontal(to: view, Grid.stripe * 2)
        continueButon.pinBottom(to: view, Grid.stripe * 2)
    }
    
    private func configureContinueButton() {
        continueButon.buttonClicked = continueButtonPressed
    }
    
    // MARK: - Actions
    @objc
    func continueButtonPressed() {
        continueButon.showAnimation {
            if self.contentStack.getTastTitleText() == "" {
                self.contentStack.setTaskTitleErrorState()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                    self.contentStack.setTaskTitleDefaultState()
                }
            } else {
                let secondPage = NewTaskSecondPageController()
                self.navigationController?.pushViewController(secondPage, animated: true)
            }
        }
    }
}
