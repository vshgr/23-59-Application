//
//  DevelopmentComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class DevelopmentComponent: UIView {
    // MARK: - Constants
    enum Constants {
        
    }
    
    // MARK: - Fields
    let label = UILabel()
    let logo = UIImageView(image: UIImage(named: "logo"))
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configurations
    private func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = CommonConstants.cornerRadius
        
        label.text = "Section is under development"
        label.font = UIFont.dl.mainFont(16)
        label.numberOfLines = 0
        label.textColor = .black
        
        addSubview(label)
        addSubview(logo)
        
        setBorder(width: 1, color: .black)
        
        logo.pinTop(to: self, CommonConstants.contentStackSpacing)
        logo.pinCenterX(to: centerXAnchor)
        label.pinHorizontal(to: self, CommonConstants.contentStackSpacing)
        label.pinTop(to: logo.bottomAnchor, CommonConstants.contentStackSpacing)
        label.pinBottom(to: self, CommonConstants.contentStackSpacing)
        
    }
}
