//
//  FriendAccountSVConponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class FriendAccountSVConponent: UIStackView {
    // MARK: - Constants
    enum Constants {
        static let imageWidth: Double = 36
    }
    
    // MARK: - Fields
    private let user = User()
    private let image = UIImageView()
    private let name = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available (*,unavailable)
    required init(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        axis = .horizontal
        spacing = CommonConstants.smallContentSpacing
        
        configureNameLabel()
        configureImage()
        
        for view in [image,name] {
            addArrangedSubview(view)
        }
        
    }
    
    private func configureNameLabel() {
        name.text = user.name
        name.textColor = .black
        name.font = UIFont.dl.ralewayMedium(15)
    }
    
    private func configureImage() {
        image.image = UIImage(named: user.profilePicUrl)
        image.setWidth(Constants.imageWidth)
        image.pinHeight(to: image.widthAnchor)
    }
}
