//
//  DescriptionFieldView.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 15.12.2022.
//

import UIKit

class DescriptionFieldView: UITextView, UITextViewDelegate {
    // MARK: - Constants
    enum Constants {
        static let error: String = "init(coder:) has not been implemented"
        static let height: Double = 130
        static let inset: CGFloat = 11
        static let descFont: UIFont = UIFont.systemFont(ofSize: 15)
    }
    
    // MARK: - Init
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configureUI()
    }
        
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        isSelectable = true
        isEditable = true
        
        text = "enter description"
        textColor = UIColor.dl.hintCol()
        font = Constants.descFont
        
        setHeight(Constants.height)
        isScrollEnabled = true
        isUserInteractionEnabled = true
        backgroundColor = .clear
        layer.cornerRadius = 10
        setBorder(width: 1, color: .black)
        
        delegate = self
        textContainerInset = UIEdgeInsets(top: Constants.inset, left: Constants.inset, bottom: Constants.inset, right: Constants.inset)
    }
}
