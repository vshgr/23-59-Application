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
        static let contentSpacing: Double = 15
        static let imagePadding: Double = 10
        static let buttonTitle: String = "add photo"
        static let buttonFont: UIFont? = UIFont.dl.ralewayMedium(14)
        static let backImageViewColor: UIColor? = UIColor(named: "mainColor")
        static let error: String = "init(coder:) has not been implemented"
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
        fatalError(Constants.error)
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
        
        button.pinTop(to: photoArea.bottomAnchor, Constants.contentSpacing)
        button.pinBottom(to: self)
        
        button.configuration = getConfig()
        button.titleLabel?.font = Constants.buttonFont
        button.addTarget(self, action: #selector(changePicTapped), for: .touchUpInside)
    }
    
    private func getConfig() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.title = Constants.buttonTitle
        config.baseForegroundColor = UIColor(named: "violet")
        config.image = UIImage(named: "photo")
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
