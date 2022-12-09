//
//  CodeInputViewController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 05.12.2022.
//

import UIKit

// TODO: Add smart switching to the next cell when tapping return

class CodeInputViewController: UIViewController, UITextFieldDelegate {
    private enum Constants {
        static let logo: UIImage? = UIImage(named: "logo")
        static let contentSpacing: Double = 15
        static let imagePadding: Double = 10
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
        static let error: String = "init(coder:) has not been implemented"
    }
    
    private let checkEmailLabel = UILabel()
    private let codeLabel = UILabel()
    private let button = UIButton(type: .system)
    private let sendCodeButton = UIButton(type: .system)
    private var codeInputCells: UIStackView = UIStackView()
    private var config = UIButton.Configuration.plain()
    private let btn = CustomButton(title: "Continue", height: 70)
    private var warningLabel: UILabel = UILabel()
    
    private var count: Int = 59
    private var timerString: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextLabels()
        setupInput()
        configureButton()
        setupSendCodeButton()
        setupTimer()
        setupLabelWarning()
        warningLabel.layer.opacity = 0
    }
    
    private func setupTimer() {
        count = 59
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if (self.count == 0) {
                timer.invalidate()
                self.button.isEnabled = true
                self.button.configuration = self.getConfig()
            } else {
                self.count -= 1
                self.button.configuration = self.getConfig()
            }
        }
    }
    
    private func makeTimerLabelString(seconds: Int) -> String {
        var timerStr = "send code again"
        if (seconds >= 10) {
            timerStr += " 0:\(seconds)"
        } else if (seconds > 0) {
            timerStr += " 0:0\(seconds)"
        }
        
        return timerStr
    }
    
    private func setupView() {
        for element in [checkEmailLabel, codeLabel, button, sendCodeButton, codeInputCells, btn, warningLabel] {
            view.addSubview(element)
        }
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
        button.setHeight(20)
        
        button.configuration = getConfig()
        button.titleLabel?.font = Constants.buttonFont
        button.isEnabled = false
        button.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
    }
    
    @objc private func restartTimer() {
        setupTimer()
    }
    
    private func getConfig() -> UIButton.Configuration {
        config.title = makeTimerLabelString(seconds: count)
        config.contentInsets = .zero
        if (count == 0) {
            config.baseForegroundColor = .black
            config.image = UIImage(named: "arrow_right")?.withTintColor(.black)
        } else {
            config.baseForegroundColor = UIColor(named: "hintColor")
            config.image = UIImage(named: "arrow_right")?.withTintColor(UIColor.dl.hintCol()!)
        }
        config.imagePlacement = .trailing
        config.imagePadding = Constants.imagePadding
        
        return config
    }
    
    private func configureButton() {
        self.view.addSubview(btn)
        
        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
    
    private func setDefaultStateCell() {
        codeInputCells.arrangedSubviews.forEach {
            $0.layer.borderColor = UIColor(named: "hintColor")?.cgColor
        }
    }
    
    private func setupLabelWarning() {
        view.addSubview(warningLabel)
        warningLabel.text = "please fill all the cells"
        warningLabel.textColor = UIColor.dl.attentionCol()
        warningLabel.font = Constants.buttonFont
        warningLabel.setHeight(20)
        warningLabel.pinLeft(to: view, Grid.stripe)
//        warningLabel.pinTop(to: codeInputCells.bottomAnchor, Constants.contentSpacing * 3)
        warningLabel.pinTop(to: button.bottomAnchor, Constants.contentSpacing)
    }
    
    @objc
    private func continueButtonPressed() {
        setDefaultStateCell()
        warningLabel.layer.opacity = 0
        
        let codeChecker = Code()
        var filled: Bool = true
        var _: () = codeInputCells.arrangedSubviews.forEach( {
            if (!codeChecker.checkCodeDigitsFilled(cell: $0 as! UITextField)) {
                $0.layer.borderColor = UIColor.red.cgColor
                filled = false
            }
        })
        
        if (filled) {
            let createAccountViewController = CreateAccountViewController()
            navigationController?.pushViewController(createAccountViewController, animated: true)
        } else {
            warningLabel.layer.opacity = 1
        }
    }
}
