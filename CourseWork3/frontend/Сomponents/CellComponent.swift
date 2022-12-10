import UIKit

class CellComponent: UIStackView {
    
    // MARK: - Fields
    private var content: UIStackView = UIStackView()
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
        for element in [firstCell, secondCell, thirdCell, fourthCell, content] {
            addSubview(element)
        }
        
        configureCells()
        configureStackView()
        addSubview(content)
//        configureTitle()
//
//        content.pinCenterY(to: self)
//        content.pinTop(to: title.bottomAnchor, 15)
        //title.pinBottom(to: content.topAnchor, 15)
    }
    
    private func configureCell(cell: UITextField) {
        cell.setBorder(width: 1, color: UIColor.dl.hintCol() ?? .gray)
        cell.layer.cornerRadius = 10
        cell.textColor = .black
        cell.font = UIFont.dl.ralewayBold(20)
        cell.textAlignment = .center
        cell.placeholder = "1"
        cell.keyboardType = .asciiCapableNumberPad
    }
    
    private func configureCells() {
        configureCell(cell: firstCell)
        configureCell(cell: secondCell)
        configureCell(cell: thirdCell)
        configureCell(cell: fourthCell)
    }
    
    private func configureStackView() {
        content = UIStackView(arrangedSubviews: [firstCell, secondCell, thirdCell, fourthCell])
        content.spacing = 12
        content.axis = .horizontal
        content.distribution = .fillEqually
    }
    
//    private func configureTitle() {
//        title.textColor = .black
//        title.font = UIFont.dl.ralewayMedium(14)
//    }
    
    // MARK: - Setters
//    private func setTitle(name: String) {
//        title.text = name
//    }
    
    private func setSize(cell: UITextField, size: Double) {
        cell.setWidth(size)
        cell.setHeight(size)
    }
}
