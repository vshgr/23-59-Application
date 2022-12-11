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
        static let contentSpacing: Double = 15
        static let imagePadding: Double = 10
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
    }
    
    // MARK: - Fields
    private var content: UIStackView = UIStackView()
    
    private let cells: CellComponent = CellComponent(size: 45)
    private let cellsTitleLabel: UILabel = UILabel()
    private let continueButton: CustomButton = CustomButton(title: "Continue", height: 70)
    private let securityCodeTextField = UITextField()
    private let checkEmailLabel = UILabel()
    private let sendCodeButton = UIButton(type: .system)
    private var sendCodeButtonConfig = UIButton.Configuration.plain()
    private let warningLabel: UILabel = UILabel()
    private var count: Int = 59
    
    // MARK: - Load
    override func viewDidLoad() {
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
        setupMainTitle()
        setupStackTitle()
        setupSendCodeAgainButton()
        setupContinueButton()
        setupStackTitle()
        setupTimer()
        setupWarningLabel()
        setupStackView()
    }
    
    private func setupMainView() {
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        securityCodeTextField.textContentType = .oneTimeCode
        overrideUserInterfaceStyle = .light
    }
    
    private func setupStackTitle() {
        cellsTitleLabel.textColor = .black
        cellsTitleLabel.font = UIFont.dl.ralewayMedium(14)
        cellsTitleLabel.text = "Code"
    }
    
    private func setupStackView() {
        for element in [checkEmailLabel, cellsTitleLabel, cells, warningLabel, sendCodeButton] {
            content.addArrangedSubview(element)
        }
        
        warningLabel.isHidden = true
        
        content.axis = .vertical
        content.spacing = Constants.contentSpacing
        content.alignment = .leading
        
        content.pinCenterY(to: view)
        content.pinLeft(to: view, Grid.stripe)
    }
    
    private func setupMainTitle() {
        checkEmailLabel.textColor = .black
        checkEmailLabel.font = UIFont.dl.mainFont(16)
        checkEmailLabel.text = "check your email"
    }
    
    private func setupSendCodeAgainButton() {
        sendCodeButton.configuration = getConfig(color: UIColor.dl.hintCol() ?? UIColor.gray)
        sendCodeButton.titleLabel?.font = Constants.buttonFont
        sendCodeButton.isEnabled = false
        
        sendCodeButton.titleLabel?.textAlignment = .left
        
        sendCodeButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
    }
    
    private func setupWarningLabel() {
        warningLabel.text = "please fill all the cells"
        warningLabel.textColor = UIColor.dl.attentionCol()
        warningLabel.font = Constants.buttonFont
    }
    
    private func setupContinueButton() {
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        
        continueButton.pinHorizontal(to: view, Grid.stripe * 2)
        continueButton.pinBottom(to: view, Grid.stripe * 2)
    }
    
    private func getConfig(color: UIColor) -> UIButton.Configuration {
        sendCodeButtonConfig.title = makeTimerLabelString(seconds: count)
        sendCodeButtonConfig.contentInsets = .zero
        
        sendCodeButtonConfig.baseForegroundColor = color
        sendCodeButtonConfig.image = UIImage(named: "arrow_right")?.withTintColor(color)
        
        sendCodeButtonConfig.imagePlacement = .trailing
        sendCodeButtonConfig.imagePadding = Constants.imagePadding
        
        return sendCodeButtonConfig
    }
    
    private func setupDefaultStateCell() {
        cells.arrangedSubviews.forEach {
            $0.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    // MARK: - Timer
    
    private func setupTimer() {
        count = 59
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if self.count == 0 {
                timer.invalidate()
                self.sendCodeButton.isEnabled = true
                self.sendCodeButton.configuration = self.getConfig(color: .black)
            } else {
                self.count -= 1
                self.sendCodeButton.configuration = self.getConfig(color: UIColor.dl.hintCol() ?? UIColor.gray)
            }
        }
    }
    
    private func makeTimerLabelString(seconds: Int) -> String {
        var timerStr = "send code again"
        if seconds >= 10 {
            timerStr += " 0:\(seconds)"
        } else if (seconds > 0) {
            timerStr += " 0:0\(seconds)"
        }
        
        return timerStr
    }
    
    // MARK: - Target
    
    @objc
    private func restartTimer() {
        setupTimer()
    }
    
    @objc
    private func continueButtonPressed() {
        setupDefaultStateCell()
        warningLabel.isHidden = true

        let codeChecker = Code()
        var filled: Bool = true
        var _: () = cells.arrangedSubviews.forEach {
            if (!codeChecker.checkCodeDigitsFilled(cell: $0 as! UITextField)) {
                $0.layer.borderColor = UIColor.dl.attentionCol()?.cgColor
                    filled = false
            }
        }

        if filled {
            let createAccountViewController = CreateAccountViewController()
            navigationController?.pushViewController(createAccountViewController, animated: true)
        } else {
            warningLabel.isHidden = false
        }
    }
}
