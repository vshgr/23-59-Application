import UIKit

class CellComponent: UIStackView, UITextFieldDelegate {
    
    // MARK: - Fields
    //private var title: UILabel = UILabel()
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
        configure()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    private func configure() {
        for element in [firstCell, secondCell, thirdCell, fourthCell] {
            addArrangedSubview(element)
            element.delegate = self
        }
        
        configureCells()
        configureTags()
        configureStackView()
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
        cell.layer.cornerRadius = 10
        cell.textColor = .black
        cell.font = UIFont.dl.ralewayBold(24)
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
        spacing = 12
        axis = .horizontal
        distribution = .fillEqually
    }
    
    // MARK: - Setters
    private func setSize(cell: UITextField, size: Double) {
        cell.setWidth(size)
        cell.setHeight(size)
    }
    
    // MARK: - Utilities
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if currentText.count == 1 {
            let nextTag = textField.tag + 1
            if let nextRespondent = textField.superview?.viewWithTag(nextTag) {
                nextRespondent.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        return updatedText.count <= 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
}
