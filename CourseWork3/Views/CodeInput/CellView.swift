import UIKit

class CellView: UIStackView, UITextFieldDelegate {
    
    // MARK: - Constants
    enum Constants {
        static let codeFontSize: CGFloat = 22
    }
    
    // MARK: - Fields
    private var firstCell: UITextField = UITextField()
    private var secondCell: UITextField = UITextField()
    private var thirdCell: UITextField = UITextField()
    private var fourthCell: UITextField = UITextField()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect = .zero, size: Double) {
        super.init(frame: frame)
        setSize(cell: firstCell, size: size)
        setSize(cell: secondCell, size: size)
        setSize(cell: thirdCell, size: size)
        setSize(cell: fourthCell, size: size)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        for element in [firstCell, secondCell, thirdCell, fourthCell] {
            addArrangedSubview(element)
            element.delegate = self
        }
        
        configureCells()
        configureTags()
        configureTextFieldTargets()
        configureStackView()
    }
    
    private func configureTextFieldTargets() {
        firstCell.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        secondCell.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        thirdCell.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        fourthCell.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
    }
    
    private func configureTags() {
        firstCell.tag = 1
        secondCell.tag = 2
        thirdCell.tag = 3
        fourthCell.tag = 4
        
        viewWithTag(1)?.becomeFirstResponder()
    }
    
    private func configureCell(cell: UITextField) {
        cell.setBorder(width: 1, color: UIColor.dl.hintCol() ?? .gray)
        cell.layer.cornerRadius = CommonConstants.cornerRadius
        cell.textColor = .black
        cell.font = cell.font?.withSize(Constants.codeFontSize)
        cell.textAlignment = .center
        cell.keyboardType = .asciiCapableNumberPad
        cell.attributedPlaceholder = NSAttributedString(
            string: "1",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.dl.hintCol() ?? .systemGray])
    }
    
    private func configureCells() {
        configureCell(cell: firstCell)
        configureCell(cell: secondCell)
        configureCell(cell: thirdCell)
        configureCell(cell: fourthCell)
    }
    
    private func configureStackView() {
        spacing = CommonConstants.horizontalStackSpacing
        axis = .horizontal
        distribution = .fillEqually
    }
    
    // MARK: - Getters and etters
    private func setSize(cell: UITextField, size: Double) {
        cell.setWidth(size)
        cell.setHeight(size)
    }
    
    func setDefaultState() {
        for element in [firstCell, secondCell, thirdCell, fourthCell] {
            element.layer.borderColor = UIColor.dl.hintCol()?.cgColor
        }
    }
    
    func getInsertedCode() -> String {
        var code: String = ""
        for element in [firstCell, secondCell, thirdCell, fourthCell] {
            code += element.text ?? "nil"
        }
        return code
    }
    
    func clearCells() {
        for element in [firstCell, secondCell, thirdCell, fourthCell] {
            element.text?.removeAll()
            element.attributedPlaceholder = NSAttributedString(
                string: "1",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.dl.hintCol() ?? .systemGray])
        }
    }
    
    // MARK: - Utilities
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    @objc
    private func textfieldDidChange(_ textField: UITextField) {
        viewWithTag(textField.tag)?.resignFirstResponder()
        if textField.text?.count == 1 {
            let nextTag = textField.tag + 1
            if let nextRespondent = textField.superview?.viewWithTag(nextTag) {
                nextRespondent.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        if textField.text?.count == 0 {
            textField.becomeFirstResponder()
        }
    }
}
