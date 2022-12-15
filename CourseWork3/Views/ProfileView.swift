//
//  ProfileView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

final class ProfileView: UIView {
    // MARK: - Constants
    private enum Constants {
        static let logo: UIImage? = UIImage(named: "logo")
        static let photoWidth: Double = 146
        static let imagePadding: Double = 10
        static let buttonTitle: String = "add photo"
        static let backImageViewColor: UIColor? = UIColor.dl.mainCol()
        static let addButtonColor: UIColor? = UIColor.dl.violetCol()
        static let buttonImage: UIImage? = UIImage(named: "photo")
    }
    
    // MARK: - Fields
    private let photoArea = UIImageView()
    private let button = UIButton(type: .system)
    
    var tapChangePic: (() -> Void)?
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        for view in [photoArea, button] {
            addSubview(view)
            view.pinCenterX(to: centerXAnchor)
        }
        
        photoArea.pinTop(to: self)
        photoArea.setWidth(Constants.photoWidth)
        photoArea.pinHeight(to: photoArea.widthAnchor)
        photoArea.pinLeft(to: self)
        
        photoArea.backgroundColor = Constants.backImageViewColor
        photoArea.image = Constants.logo
        photoArea.contentMode = .center
        photoArea.layer.cornerRadius = Constants.photoWidth / 2
        
        button.pinTop(to: photoArea.bottomAnchor, CommonConstants.smallContentSpacing)
        button.pinBottom(to: self)
        
        button.configuration = getConfig()
        button.titleLabel?.font = CommonConstants.mainLabelFont
        button.addTarget(self, action: #selector(changePicTapped), for: .touchUpInside)
    }
    
    private func getConfig() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.title = Constants.buttonTitle
        config.baseForegroundColor = Constants.addButtonColor
        config.image = Constants.buttonImage
        config.imagePlacement = .trailing
        config.imagePadding = Constants.imagePadding
        
        return config
    }
    
    // MARK: - Actions
    @objc
    private func changePicTapped(){
        tapChangePic?()
    }
}
