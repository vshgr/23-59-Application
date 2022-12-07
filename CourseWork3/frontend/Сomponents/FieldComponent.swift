import UIKit

class InputFieldView: UIView, UITextFieldDelegate {
    // MARK: - Fields
    private let label = UILabel()
    private let input = UITextField()
    private let underline = UIView()
    private let errorMessage = UILabel()
    
    public func getText() -> String {
        return input.text ?? ""
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(frame: CGRect = .zero, title: String, hint: String, message: String){
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
    }
    
    private func configureUnderline() {
        underline.setHeight(1)
        underline.backgroundColor = UIColor(named: "black")
    }
    
    private func configureErrorMessage() {
        errorMessage.textColor = UIColor(named: "attentionColor")
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
        input.pinTop(to: label.bottomAnchor, 14)
        underline.pinTop(to: input.bottomAnchor, 11)
        errorMessage.pinTop(to: underline.bottomAnchor, 8)
        errorMessage.pinBottom(to: self)
    }
    
    // MARK: - Setters
    private func setTitle(title: String) {
        label.text = title
    }
    
    private func setPlaceholder(hint: String){
        input.placeholder = hint
    }
    
    private func setErrorMessage(message: String){
        errorMessage.text = message
    }
    
    public func pinToParent(parent: UIView){
        underline.setWidth(parent.frame.width - 2 * Grid.stripe)
    }
        
    public func setErrorState() {
        errorMessage.isHidden = false
        input.textColor = UIColor(named: "attentionColor")
        label.textColor = UIColor(named: "attentionColor")
        underline.backgroundColor = UIColor(named: "attentionColor")
    }

    public func setDefaultState() {
        errorMessage.isHidden = true
        input.textColor = UIColor(named: "black")
        label.textColor = UIColor(named: "black")
        underline.backgroundColor = UIColor(named: "black")
    }
    
}
