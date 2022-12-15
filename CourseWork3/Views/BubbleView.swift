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
    }
    
    // MARK: - Fields
    private let dateLabel = UILabel()
    private let bubbleText: String
    private var bubbleSelected: Bool = false
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
        fatalError("init(coder:) has not been implemented")
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
        titleLabel?.font = titleLabel?.font.withSize(12)
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 1
        setHeight(intrinsicContentSize.height + Constants.width / 6)
        setWidth(intrinsicContentSize.width + Constants.width)
        setBorder(width: 1, color: .black)
    }
    
    // MARK: - Getters
    public func getText() -> String {
        return bubbleText
    }
    
    @objc
    func bubbleClicked() {
        if isInteractable {
            bubbleSelected.toggle()
            if bubbleSelected == true {
                backgroundColor = .black
                setTitleColor(.white, for: .normal)
            } else {
                backgroundColor = .clear
                setTitleColor(.black, for: .normal)
            }
        }
    }
}
