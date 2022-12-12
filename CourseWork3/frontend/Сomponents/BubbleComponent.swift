//
//  DateBubbleComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class BubbleComponent: UIButton {
    private let dateLabel = UILabel()
    private let bubbleText: String
    private var config = UIButton.Configuration.plain()
    
    // MARK: - Init
    init(frame: CGRect = .zero, text: String) {
        bubbleText = text
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
        addSubview(dateLabel)
        configureLabel()
        setBorder(width: 1, color: .black)
    }
    
    private func configureLabel() {
        setTitle(bubbleText, for: .normal)
        setTitleColor(.black, for: .normal)
        // ИСПОЛЬЗОВАТЬ КОНФИГ
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 17, bottom: 10, right: 17)
        titleLabel?.font = UIFont(name: "PingFangTC-Medium", size: 12)
//        titleLabel?.font = dateLabel.font.withSize(12)
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 1

    }
    
    // MARK: - Getters
    public func getText() -> String {
        return bubbleText
    }
    
}
