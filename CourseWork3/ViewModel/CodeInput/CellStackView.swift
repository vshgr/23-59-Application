//
//  CellStackView.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 15.12.2022.
//

import UIKit

class CellStackView: UIStackView {
    
    // MARK: - Constants
    enum Constants {
        static let error: String = "init(coder:) has not been implemented"
        static let contentSpacing: Double = 15
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
    }
    
    // MARK: - Fields
    private var content: UIStackView = UIStackView()
    private let checkEmailLabel = UILabel()
    private let warningLabel: UILabel = UILabel()
    private let cellsTitleLabel: UILabel = UILabel()
    private let cells: CellComponent = CellComponent(size: 45)
    private let sendBtn = ButtonWithArrowView(title: "send code again")
    private let securityCodeTextField = UITextField()
    private var count: Int = 59
    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        securityCodeTextField.textContentType = .oneTimeCode
        
        configureCheckEmailLabel()
        configureCellsTitleLabel()
        configureWarningLabel()
        configureSendButton()
        configureStack()
    }
    
    private func configureStack() {
        for element in [checkEmailLabel, cellsTitleLabel, cells, warningLabel, sendBtn] {
            addArrangedSubview(element)
        }
        makeWarningLabelHidden()
        axis = .vertical
        spacing = Constants.contentSpacing
        alignment = .leading
    }
    
    private func configureCheckEmailLabel() {
        checkEmailLabel.textColor = .black
        checkEmailLabel.font = UIFont.dl.mainFont(16)
        checkEmailLabel.text = "check your email"
    }
    
    private func configureCellsTitleLabel() {
        cellsTitleLabel.textColor = .black
        cellsTitleLabel.font = UIFont.dl.ralewayMedium(14)
        cellsTitleLabel.text = "Code"
    }
    
    private func configureWarningLabel() {
        warningLabel.text = "please fill all the cells"
        warningLabel.textColor = UIColor.dl.attentionCol()
        warningLabel.font = Constants.buttonFont
    }
    
    private func configureSendButton() {
        sendBtn.setDisabledState()
        sendBtn.setTitle(title: configureTimerLabelString(seconds: count))
        sendBtn.buttonClicked = restartTimer
    }
    
    private func configureTimerLabelString(seconds: Int) -> String {
        var timerStr = "send code again"
        if seconds >= 10 {
            timerStr += " 0:\(seconds)"
        } else if (seconds > 0) {
            timerStr += " 0:0\(seconds)"
        }
        
        return timerStr
    }
    
    // MARK: - Setters
    func configureDefaultStateCell() {
        cells.arrangedSubviews.forEach {
            $0.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    func makeWarningLabelHidden() {
        warningLabel.isHidden = true
    }
    
    func makeWarningLabelVisible() {
        warningLabel.isHidden = false
    }
    
    // MARK: - Timer
    func startTimer() {
        count = 59
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.sendBtn.setTitle(title: self.configureTimerLabelString(seconds: self.count))
            if self.count == 0 {
                timer.invalidate()
                self.sendBtn.setEnabledState()
            } else {
                self.count -= 1
                self.sendBtn.setDisabledState()
            }
        }
    }
    
    // MARK: - Checkers
    func checkIfCellsAreFilled() -> Bool {
        let codeChecker = Code()
        var cellsFilled = true
        var _: () = cells.arrangedSubviews.forEach {
            if (!codeChecker.checkCodeDigitsFilled(cell: $0 as! UITextField)) {
                $0.layer.borderColor = UIColor.dl.attentionCol()?.cgColor
                    cellsFilled = false
            }
        }
        
        return cellsFilled
    }
    
    // MARK: - Actions
    @objc
    private func restartTimer() {
        startTimer()
    }
}
