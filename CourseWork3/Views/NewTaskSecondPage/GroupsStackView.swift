//
//  VisibilityStackView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 15.12.2022.
//

import UIKit

class GroupsStackView: UIStackView {
    // MARK: - Constants
    enum Constants {
        static let fieldSpacing: Double = 14
        static let error: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private let groupsScroll = BubblesScrollView(isInteractable: true)
    private let groupsLabel = UILabel()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    init(frame: CGRect = .zero, size: Double) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        axis = .vertical
        spacing = Constants.fieldSpacing
        
        configureLabel()
        for view in [groupsLabel, groupsScroll] {
            addArrangedSubview(view)
        }
    }
    
    private func configureLabel() {
        groupsLabel.text = "Groups"
        groupsLabel.font = UIFont.dl.ralewayMedium(14)
        groupsLabel.textColor = .black
    }
}
