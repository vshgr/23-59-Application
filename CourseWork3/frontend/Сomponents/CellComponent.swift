import UIKit

class CellComponent: UIStackView {
    
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
        }
        
        configureCells()
        configureStackView()
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
}
