//
//  CodeInputViewController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 05.12.2022.
//

import UIKit

// TODO: Add smart switching to the next cell when tapping return
// TODO: Add disabled button send code again and timer

class CodeInputViewController: UIViewController, UITextFieldDelegate {
    private let checkEmailLabel = UILabel()
    private let codeLabel = UILabel()
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextLabels()
        setupInput()
        configureButton()
//        firstTextField.delegate = self
//        firstTextField.tag = 0
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setupTextLabels() {
        codeLabel.textColor = .black
        codeLabel.font = UIFont(name: "Raleway-Medium", size: 14)
        codeLabel.text = "Code"
        
        self.view.addSubview(codeLabel)
        
        codeLabel.pinLeft(to: view, Grid.stripe)
        codeLabel.pinBottom(to: view, 493)
        
        // New label
        checkEmailLabel.textColor = .black
        checkEmailLabel.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 16)
        checkEmailLabel.text = "check your email"
        
        self.view.addSubview(checkEmailLabel)
        
        checkEmailLabel.pinLeft(to: view, Grid.stripe)
        checkEmailLabel.pinBottom(to: view, 525)
    }
    
    private func makeCodeTextField() -> UITextField {
        let codeInput = UITextField()
        codeInput.setBorder(width: 1, color: UIColor(named: "hintColor") ?? .gray)
        
        codeInput.textColor = .black
        codeInput.font = UIFont(name: "Raleway-Medium", size: 16)
        codeInput.placeholder = "1"
        
        return codeInput
    }
    
    private func setupTextFields() -> UITextField {
        let field = UITextField()
        field.setBorder(width: 1, color: UIColor(named: "hintColor") ?? .gray)
        field.layer.cornerRadius = 10
        field.textColor = .black
        field.font = UIFont(name: "Raleway-Bold", size: 20)
        field.textAlignment = .center
        field.placeholder = "1"
        field.keyboardType = .asciiCapableNumberPad
        field.setWidth(38)
        field.setHeight(38)
        return field
    }
    
    // Not used yet
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          // Try to find next responder
          if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
             nextField.becomeFirstResponder()
          } else {
             // Not found, so remove keyboard.
             textField.resignFirstResponder()
          }
          // Do not add a line break
          return false
    }
    
    private func setupInput() {
        let stack = UIStackView()
        stack.spacing = 12
        
        stack.pinBottom(to: view.centerYAnchor, 22)
        for textField in [setupTextFields(), setupTextFields(), setupTextFields(), setupTextFields()] {
            stack.addArrangedSubview(textField)
        }
    }
    
    private func configureButton() {
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor(named: "white"), for: .normal)
        button.titleLabel?.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 18)
        button.backgroundColor = UIColor(named: "black")
        self.view.addSubview(button)
        
        button.setHeight(view.frame.size.height * 0.08)
        button.layer.cornerRadius = view.frame.size.height * 0.08 / 2

        button.pinHorizontal(to: view, Grid.stripe * 2)
        button.pinBottom(to: view, Grid.stripe * 2)
        
        button.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func continueButtonPressed() {
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }
}


