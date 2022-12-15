//
//  CodeInputView.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 15.12.2022.
//

import UIKit

class CodeInputView: UIStackView {
    
    // MARK: - Constants
    enum Constants {
        static let mainFont: UIFont? = UIFont.dl.mainFont(16)
        static let cellSize: Double = 45
    }
    
    // MARK: - Fields
    private var content: UIStackView = UIStackView()
    private let checkEmailLabel = UILabel()
    private let warningLabel: UILabel = UILabel()
    private let cellsTitleLabel: UILabel = UILabel()
    private let cells: CellView = CellView(size: Constants.cellSize)
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
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        securityCodeTextField.textContentType = .oneTimeCode
        configureLabels()
        configureSendButton()
        configureStack()
    }
    
    private func configureStack() {
        for element in [checkEmailLabel, cellsTitleLabel, cells, warningLabel, sendBtn] {
            addArrangedSubview(element)
        }
        cells.cellTapped = makeWarningLabelHidden
        makeWarningLabelHidden()
        axis = .vertical
        spacing = CommonConstants.smallContentSpacing
        alignment = .leading
    }
    
    private func configureLabels() {
        configureLabel(label: checkEmailLabel, font: Constants.mainFont ?? .systemFont(ofSize: 16), text: "check your email", textColor: .black)
        configureLabel(label: cellsTitleLabel, font: CommonConstants.mainLabelFont ?? .systemFont(ofSize: 14), text: "Code", textColor: .black)
        configureLabel(label: warningLabel, font: CommonConstants.mainLabelFont ?? .systemFont(ofSize: 14), textColor: UIColor.dl.attentionCol() ?? .red)
    }
    
    private func configureLabel(label: UILabel, font: UIFont, text: String = "", textColor: UIColor) {
        label.textColor = textColor
        label.font = font
        label.text = text
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
        cells.setDefaultState()
    }
    
    func makeWarningLabelHidden() {
        warningLabel.isHidden = true
    }
    
    func makeWarningLabelVisible() {
        warningLabel.isHidden = false
    }
    
    func setWarningLabelText(text: String) {
        warningLabel.text = text
    }
    
    func clearCells() {
        cells.clearCells()
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
            if (!codeChecker.checkCodeDigitsFilled(cell: $0 as? UITextField ?? UITextField())) {
                $0.layer.borderColor = UIColor.dl.attentionCol()?.cgColor
                cellsFilled = false
            }
        }
        
        return cellsFilled
    }
    
    func checkIfCodeIsCorrect() -> Bool {
        let code = cells.getInsertedCode()
        if code == "1234" {
            return true
        }
        return false
    }
    
    // MARK: - Actions
    @objc
    private func restartTimer() {
        startTimer()
    }
}
