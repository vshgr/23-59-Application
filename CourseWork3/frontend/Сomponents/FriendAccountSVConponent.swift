//
//  FriendAccountSVConponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class FriendAccountSVConponent: UIStackView {
    private let image = UIImageView()
    private let name = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available (*,unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        axis = .horizontal
        spacing = 15
        
        configureNameLabel()
        configureImage()
        
        for view in [image,name] {
            addArrangedSubview(view)
        }
        
    }
    
    private func configureNameLabel() {
        name.text = "Yana Barbashina"
        name.textColor = .black
        name.font = UIFont.dl.ralewayMedium(15)
    }
    
    private func configureImage() {
        image.image = UIImage(named: "rabbit")
        image.setWidth(36)
        image.pinHeight(to: image.widthAnchor)
    }
}
