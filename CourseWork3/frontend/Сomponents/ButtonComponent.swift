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
    
    init(frame: CGRect = .zero, title: String, height: CGFloat){
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
        setTitleColor(UIColor(named: "white"), for: .normal)
        titleLabel?.font = UIFont.dl.mainFont(18)
        backgroundColor = UIColor(named: "black")
        
        setHeight(height * 0.08)
        layer.cornerRadius = height * 0.08 / 2
    }
}
