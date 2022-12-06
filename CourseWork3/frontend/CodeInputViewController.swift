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
        
        let grid = Grid(view: self.view)
        
        codeLabel.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 493])
        
        // New label
        checkEmailLabel.textColor = .black
        checkEmailLabel.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 16)
        checkEmailLabel.text = "check your email"
        
        self.view.addSubview(checkEmailLabel)
        
        checkEmailLabel.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 525])
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
        field.setWidth(to: 38)
        field.setHeight(to: 38)
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
        let firstTextField = setupTextFields()
        let secondTextField = setupTextFields()
        let thirdTextField = setupTextFields()
        let fourthTextField = setupTextFields()
        
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(thirdTextField)
        view.addSubview(fourthTextField)
        
        let grid = Grid(view: view)
        firstTextField.pin(to: view, [.left:
                                        grid.pin, .bottom: 444])
        secondTextField.pin(to: view, [.left:
                                        grid.pin + 50, .bottom: 444])
        thirdTextField.pin(to: view, [.left:
                                        grid.pin + 100, .bottom: 444])
        fourthTextField.pin(to: view, [.left:
                                        grid.pin + 150, .bottom: 444])

    }
    
    private func configureButton() {
        let grid = Grid(view: self.view)
        
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor(named: "white"), for: .normal)
        button.titleLabel?.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 18)
        button.backgroundColor = UIColor(named: "black")
        self.view.addSubview(button)
        
        button.setHeight(to: view.frame.size.height * 0.08)
        button.layer.cornerRadius = view.frame.size.height * 0.08 / 2
        
        button.pin(to: self.view, [.left: grid.margin * 2, .right: grid.margin * 2, .bottom: grid.margin * 2])
        
        button.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func continueButtonPressed() {
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }
}


