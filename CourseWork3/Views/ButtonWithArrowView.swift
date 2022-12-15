//
//  ButtonWithArrowView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 14.12.2022.
//

import UIKit

class ButtonWithArrowView: UIButton {
    // MARK: - Constants
    enum Constants {
        static let imagePaddind: Double = 10
        static let arrowImage: UIImage? = UIImage(named: "arrow_right")
    }
    
    // MARK: - Fields
    var buttonClicked: (() -> Void)?
    private let buttonTitle: String
    private var config = UIButton.Configuration.plain()
    
    // MARK: - Inits
    init(frame: CGRect = .zero, title: String){
        self.buttonTitle = title
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configure
    private func configure() {
        addTarget(self, action: #selector(arrowButtonClicked), for: .touchUpInside)
        titleLabel?.font = UIFont.dl.ralewayMedium(14)
        
        config.title = buttonTitle
        config.contentInsets = .zero
        config.baseForegroundColor = .black
        config.image = Constants.arrowImage?.withTintColor(.black)
        config.imagePlacement = .trailing
        config.imagePadding = Constants.imagePaddind
        
        self.configuration = config
    }
    
    func setEnabledState() {
        isEnabled = true
        config.baseForegroundColor = .black
        config.image = Constants.arrowImage?.withTintColor(.black)
        
        self.configuration = config
    }
    
    func setDisabledState() {
        isEnabled = false
        config.baseForegroundColor = UIColor.dl.hintCol()
        config.image = Constants.arrowImage?.withTintColor(UIColor.dl.hintCol() ?? .gray)
        
        self.configuration = config
    }
    
    func setTitle(title: String) {
        config.title = title
        self.configuration = config
    }
    
    @objc
    func arrowButtonClicked() {
        buttonClicked?()
    }
}
