import UIKit

class InputFieldView: UIView {
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont(name: "Raleway-Medium", size: 14)
        lbl.textAlignment = .left
        return lbl
    } ()
    
    private let input: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.font = UIFont(name: "Raleway-Medium", size: 15)
        return tf
    } ()

    
    private let underline: UIView = {
        let v  = UIView()
        v.setHeight(to: 1)
        v.backgroundColor = UIColor(named: "black")
        return v
    } ()
    
    
    private let errorMessage: UILabel = {
        let er = UILabel()
        er.textColor = UIColor(named: "attentionColor")
        er.font = UIFont(name: "Raleway-Medium", size: 15)
        return er
    } ()
    
    public func getText() -> String {
        return input.text ?? ""
    }
    
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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func setTitle(title: String) {
        label.text = title
    }
    
    private func setPlaceholder(hint: String){
        input.placeholder = hint
    }
    
    private func setErrorMessage(message: String){
        errorMessage.text = message
    }
    
    private func configure() {
        addSubview(label)
        label.pin(to: self)
        addSubview(input)
        input.pinTop(to: label.bottomAnchor, 14)
        addSubview(underline)
        underline.pinTop(to: input.bottomAnchor, 11)
        addSubview(errorMessage)
        errorMessage.pinTop(to: underline.bottomAnchor, 8)
    }
    
    public func pinToParent(parent: UIView){
        let grid = Grid(view: parent)
        underline.setWidth(to: parent.frame.width - 2 * grid.margin)
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
