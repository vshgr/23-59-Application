//
//  DevelopmentComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 09.12.2022.
//

import UIKit

class DevelopmentComponent: UIView {
    let label = UILabel()
    let logo = UIImageView(image: UIImage(named: "logo"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = 20
        
        label.text = "Section is under development"
        label.font = UIFont.dl.mainFont(16)
        label.numberOfLines = 0
        label.textColor = .black
        
        addSubview(label)
        addSubview(logo)
        
        setBorder(width: 1, color: .black)
        
        logo.pinTop(to: self, 30)
        logo.pinCenterX(to: centerXAnchor)
        label.pinHorizontal(to: self, 30)
        label.pinTop(to: logo.bottomAnchor, 30)
        label.pinBottom(to: self, 30)
        
    }
}
