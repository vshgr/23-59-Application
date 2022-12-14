//
//  ButtonComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 06.12.2022.
//

import UIKit

class CustomButton: UIButton {
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect = .zero, title: String, height: CGFloat = 70){
        super.init(frame: frame)
        configure(title: title, height: height)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configure
    private func configure(title: String, height: CGFloat) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.dl.mainFont(18)
        backgroundColor = .black
        
        setHeight(height)
        layer.cornerRadius = height / 2
    }
}
