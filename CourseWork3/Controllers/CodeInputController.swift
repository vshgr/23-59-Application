//
//  NewCodeInputController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 09.12.2022.
//

import UIKit

class CodeInputController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let imagePadding: Double = 10
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
    }
    
    // MARK: - Fields
    private var content: CodeInputView = CodeInputView()
    private let continueButton: ButtonView = ButtonView(title: "Continue")
    
    // MARK: - Load
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    // MARK: - Configuration
    private func setupView() {
        for element in [content, continueButton] {
            view.addSubview(element)
        }
        
        setupMainView()
        setupContinueButton()
        setupStackView()
    }
    
    private func setupMainView() {
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        overrideUserInterfaceStyle = .light
    }
    
    private func setupStackView() {
        content.startTimer()
        content.pinCenterY(to: view)
        content.pinLeft(to: view, Grid.stripe)
    }
    
    private func setupContinueButton() {
        continueButton.buttonClicked = continueButtonPressed
        continueButton.pinHorizontal(to: view, Grid.stripe * 2)
        continueButton.pinBottom(to: view, Grid.stripe * 2)
    }
    
    // MARK: - Actions
    @objc
    private func continueButtonPressed() {
        content.configureDefaultStateCell()
        content.makeWarningLabelHidden()
        
        if !content.checkIfCellsAreFilled() {
            content.setWarningLabelText(text: "please fill all the cells")
            content.makeWarningLabelVisible()
        } else if !content.checkIfCodeIsCorrect() {
            content.setWarningLabelText(text: "code is incorrect")
            content.makeWarningLabelVisible()
            content.clearCells()
        } else {
            let createAccountViewController = CreateAccountViewController()
            navigationController?.pushViewController(createAccountViewController, animated: true)
        }
    }
}
