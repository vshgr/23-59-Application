//
//  VisibilityStackView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 15.12.2022.
//

import UIKit

class VisibilityStackView: UIStackView {
    // MARK: - Constants
    enum Constants {
        static let fieldSpacing: Double = 14
        static let labelText: String = "Visibility"
        static let error: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private let visibilityScroll = BubblesScrollView(isInteractable: true, data: ["private", "public"])
    private let visibilityLabel = UILabel()
    private let errorMessage = UILabel()
    
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
        visibilityScroll.onlyOneSelected = true
        
        configureLabel()
        for view in [visibilityLabel, visibilityScroll] {
            addArrangedSubview(view)
        }
    }
    
    private func configureLabel() {
        visibilityLabel.text = Constants.labelText
        visibilityLabel.font = UIFont.dl.ralewayMedium(14)
        visibilityLabel.textColor = .black
    }
    
    func setErrorState() {
        visibilityLabel.textColor = UIColor.dl.attentionCol()
    }
    
    func setDefaultState() {
        visibilityLabel.textColor = .black
    }
    
    func isSomeSelected() -> Bool {
        visibilityScroll.isSomeSelected()
    }
}
