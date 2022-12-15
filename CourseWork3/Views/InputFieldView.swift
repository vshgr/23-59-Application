import UIKit

enum InputType {
    case email
    case normal
    case username
}

class InputFieldView: UIView, UITextFieldDelegate {
    // MARK: - Constants
    enum Constants {
        static let underlineSpacind: Double = 8
        static let errorSpacing: Double = 11
    }
    
    // MARK: - Fields
    private let label = UILabel()
    private var input = UITextField()
    private let underline = UIView()
    private let errorMessage = UILabel()
    private var keyboardType = UIKeyboardType.default
    public func getText() -> String {
        return input.text ?? ""
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(frame: CGRect = .zero, title: String = "", hint: String = "", message: String = "", keyboard: UIKeyboardType = UIKeyboardType.default) {
        self.keyboardType = keyboard
        super.init(frame: frame)
        setPicker(type: title)
        setTitle(title: title)
        setPlaceholder(hint: hint)
        setErrorMessage(message: message)
        configure()
        setDefaultState()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    private func configureLabel() {
        label.textColor = .black
        label.font = CommonConstants.mainLabelFont
        label.textAlignment = .left
    }
    
    private func configureTextField() {
        input.textColor = .black
        input.font = input.font?.withSize(15)
        input.delegate = self
        input.keyboardType = keyboardType
    }
    
    private func configureUnderline() {
        underline.setHeight(1)
        underline.backgroundColor = .black
    }
    
    private func configureErrorMessage() {
        errorMessage.textColor = UIColor.dl.attentionCol()
        errorMessage.font = CommonConstants.mainLabelFont
    }
    
    private func configure() {
        addSubview(label)
        addSubview(input)
        addSubview(underline)
        addSubview(errorMessage)
        
        configureLabel()
        configureTextField()
        configureUnderline()
        configureErrorMessage()
        
        label.pinTop(to: self)
        label.pinHorizontal(to: self)
        input.pinTop(to: label.bottomAnchor, CommonConstants.smallContentSpacing)
        input.pinHorizontal(to: self)
        underline.pinTop(to: input.bottomAnchor, Constants.errorSpacing)
        underline.pinHorizontal(to: self)
        errorMessage.pinTop(to: underline.bottomAnchor, Constants.underlineSpacind)
        errorMessage.pinHorizontal(to: self)
        errorMessage.pinBottom(to: self)
    }
    
    // MARK: - Setters
    private func setPicker(type: String) {
        if type == "Deadline date" {
            input = DateTextFieldView()
        } else if type == "Time" {
            input = TimeTextFieldView()
        }
    }
    
    func setTitle(title: String) {
        label.text = title
    }
    
    func setPlaceholder(hint: String){
        input.attributedPlaceholder = NSAttributedString(
            string: hint,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.dl.hintCol() ?? .systemGray])
    }
    
    func setErrorMessage(message: String){
        errorMessage.text = message
    }
    
    func setErrorState() {
        errorMessage.isHidden = false
        label.textColor = UIColor.dl.attentionCol()
        underline.backgroundColor = UIColor.dl.attentionCol()
    }
    
    func setDefaultState() {
        errorMessage.isHidden = true
        label.textColor = .black
        underline.backgroundColor = .black
    }
    
    // MARK: - Functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setDefaultState()
    }
    
    
    // MARK: - Checker
    func checkInputCorrect(type: InputType, value: String) -> Bool {
        let regEx: String
        let pred: NSPredicate
        switch type {
        case InputType.email:
            regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            pred = NSPredicate(format:"SELF MATCHES %@", regEx)
            return pred.evaluate(with: value)
        case InputType.username:
            regEx = "\\w{5,18}"
            pred = NSPredicate(format:"SELF MATCHES %@", regEx)
            return pred.evaluate(with: value)
        default:
            return !value.trimmingCharacters(in: .whitespaces).isEmpty
        }
    }
}
