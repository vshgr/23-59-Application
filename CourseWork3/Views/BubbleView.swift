//
//  DateBubbleComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class BubbleView: UIButton {
    // MARK: - Constants
    enum Constants {
        static let width: Double = 30
        static let numOfLines: Int = 1
    }
    
    // MARK: - Fields
    private let dateLabel = UILabel()
    private let bubbleText: String
    var bubbleSelected: Bool = false
    private let isInteractable: Bool
    
    // MARK: - Init
    init(frame: CGRect = .zero, text: String = "", isInteractable: Bool = false) {
        bubbleText = text
        self.isInteractable = isInteractable
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = bounds.height
        layer.cornerRadius = height/2
    }
    
    private func configureUI() {
        addTarget(self, action: #selector(bubbleClicked), for: .touchUpInside)
        setTitle(bubbleText, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = Constants.numOfLines
        setHeight(intrinsicContentSize.height + Constants.width / 6)
        setWidth(intrinsicContentSize.width + Constants.width)
        setBorder(width: 1, color: .black)
    }
    
    // MARK: - Getters
    public func getText() -> String {
        return bubbleText
    }
    
    // MARK: - Setters
    func setSelected() {
        bubbleSelected = true
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
    }
    
    func setUnselected() {
        bubbleSelected = false
        backgroundColor = .clear
        setTitleColor(.black, for: .normal)
    }
    
    // MARK: - Actions
    @objc
    func bubbleClicked() {
        if isInteractable {
            showAnimation { [self] in
                if bubbleSelected == true {
                    setUnselected()
                } else {
                    setSelected()
                }
            }
        }
    }
}
