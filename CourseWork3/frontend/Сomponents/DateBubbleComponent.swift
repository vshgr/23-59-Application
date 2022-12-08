//
//  DateBubbleComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class DateBubbleComponent: UIView {
    private let dateLabel = UILabel()
    
    // MARK: - Init
    override init(frame: CGRect) {
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
        dateLabel.pinVertical(to: self, 6)
        dateLabel.pinHorizontal(to: self, 17)
    }
    
    private func configureLabel() {
        dateLabel.text = "4 Dec, 2022"
        dateLabel.font = UIFont.dl.ralewayMedium(12)
        dateLabel.textColor = .black
    }
    
}
