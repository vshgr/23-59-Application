import UIKit

class InputFieldView: UIView, UITextFieldDelegate {
    // MARK: - Fields
    private let label = UILabel()
    private let input = UITextField()
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
        setTitle(title: title)
        setPlaceholder(hint: hint)
        setErrorMessage(message: message)
        configure()
        setDefaultState()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    private func configureLabel() {
        label.textColor = .black
        label.font = UIFont.dl.ralewayMedium(14)
        label.textAlignment = .left
    }
    
    private func configureTextField() {
        input.textColor = .black
        input.font = UIFont.dl.ralewayMedium(15)
        input.delegate = self
        input.keyboardType = keyboardType
    }
    
    private func configureUnderline() {
        underline.setHeight(1)
        underline.backgroundColor = .black
    }
    
    private func configureErrorMessage() {
        errorMessage.textColor = UIColor.dl.attentionCol()
        errorMessage.font = UIFont.dl.ralewayMedium(15)
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
        input.pinTop(to: label.bottomAnchor, 14)
        input.pinHorizontal(to: self)
        underline.pinTop(to: input.bottomAnchor, 11)
        underline.pinHorizontal(to: self)
        errorMessage.pinTop(to: underline.bottomAnchor, 8)
        errorMessage.pinHorizontal(to: self)
        errorMessage.pinBottom(to: self)
    }
    
    // MARK: - Setters
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
    
    
}
