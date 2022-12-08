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
    private enum Constants {
        static let logo: UIImage? = UIImage(named: "logo")
        static let contentSpacing: Double = 15
        static let imagePadding: Double = 10
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
        static let backImageViewColor: UIColor? = UIColor(named: "mainColor")
        static let error: String = "init(coder:) has not been implemented"
    }
    
    private let checkEmailLabel = UILabel()
    private let codeLabel = UILabel()
    private let button = UIButton(type: .custom)
    private let sendCodeButton = UIButton(type: .system)
    private var codeInputCells: UIStackView = UIStackView()
    private var count = 59 {
        didSet {
            timerLabel = "send code again 0:\(count)"
        }
    }
    
    private var timer = Timer()
    private var timerLabel = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextLabels()
        setupInput()
        configureButton()
        setupSendCodeButton()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setupTimer), userInfo: nil, repeats: false)
//        firstTextField.delegate = self
//        firstTextField.tag = 0
    }
    
    
    @objc private func setupTimer() {
        count -= 1
        
        if (count == 0) {
            timer.invalidate()
            timerLabel = "send code again"
            button.isEnabled = true
        }
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
        let firstTextField = setupTextFields()
        let secondTextField = setupTextFields()
        let thirdTextField = setupTextFields()
        let fourthTextField = setupTextFields()
        
        codeInputCells = UIStackView(arrangedSubviews: [firstTextField, secondTextField, thirdTextField, fourthTextField])
        codeInputCells.spacing = 12
        codeInputCells.axis = .horizontal
        codeInputCells.distribution = .fillEqually
        self.view.addSubview(codeInputCells)
        
        codeInputCells.pinLeft(to: view, Grid.stripe)
        codeInputCells.pinBottom(to: view, 444)
    }
    
    private func setupSendCodeButton() {
        view.addSubview(button)
        
        button.pinTop(to: codeInputCells.bottomAnchor, Constants.contentSpacing)
        button.pinLeft(to: view, Grid.stripe)
        
        button.configuration = getConfig()
        button.titleLabel?.font = Constants.buttonFont
        button.isEnabled = false
    }
    
    private func getConfig() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        // Use timer here
        config.title = "send code again"
        config.baseForegroundColor = UIColor(named: "hintColor")
        config.image = UIImage(named: "arrow_right")
        config.imagePlacement = .trailing
        config.imagePadding = Constants.imagePadding
        
        return config
    }
    
    private func configureButton() {
        let btn = CustomButton(title: "Continue", height: view.frame.size.height)
        self.view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func continueButtonPressed() {
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }
}
