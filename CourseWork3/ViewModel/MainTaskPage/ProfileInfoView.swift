//
//  ProfileInfoView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 14.12.2022.
//

import UIKit

class ProfileInfoView : UIStackView {
    // MARK: - Constants
    enum Constants {
        static let picWH: Double = 75
        static let multiline: Int = 0
        static let spacing: Double = 25
        static let error: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private let user = User()
    private let name = UILabel()
    private let username = UILabel()
    private let nameStack = UIStackView()
    private var profilePic = UIImageView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*,unavailable)
    required init(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    // MARK: - Configurations
    private func configureUI() {
        axis = .horizontal
        alignment = .center
        spacing = Constants.spacing
        
        configureNameLabel()
        configureUsernameLabel()
        configureProfilePic()
        configureNameStack()
        
        for view in [nameStack, profilePic] {
            addArrangedSubview(view)
        }
    }
    
    private func configureNameLabel() {
        name.text = user.name
        name.font = UIFont.dl.ralewayBold(20)
        name.numberOfLines = Constants.multiline
        name.textColor = .black
    }
    
    private func configureUsernameLabel() {
        username.textColor = .black
        username.text = "@" + user.username
        username.font = username.font.withSize(14)
    }
    
    private func configureNameStack() {
        nameStack.axis = .vertical
        nameStack.addArrangedSubview(name)
        nameStack.addArrangedSubview(username)
        nameStack.alignment = .leading
    }
    
    private func configureProfilePic() {
        profilePic = UIImageView(image: UIImage(named: user.profilePicUrl))
        profilePic.setWidth(Constants.picWH)
        profilePic.pinHeight(to: profilePic.widthAnchor)
    }
}
