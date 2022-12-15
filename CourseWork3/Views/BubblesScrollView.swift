//
//  BubblesScrollView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 15.12.2022.
//

import UIKit

enum BubblesType {
    case filled
    case stroked
}

class BubblesScrollView: UIScrollView {
    enum Constants {
        static let spacing: Double = 12
        static let height: Double = 40
    }
    
    // MARK: - Fields
    private let task = Task()
    private let stack = UIStackView()
    private var type = BubblesType.stroked
    private let isInteractable: Bool
    
    // MARK: - Init
    init(frame: CGRect = .zero, type: BubblesType = .stroked, isInteractable: Bool = false) {
        self.type = type
        self.isInteractable = isInteractable
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        clipsToBounds = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        setHeight(Constants.height)
        
        addSubview(stack)
        stack.pinCenterY(to: centerYAnchor)
    
        configureStack()
    }
    
    private func getGroup(title: String) -> UIView {
        let group = BubbleView(text: title, isInteractable: isInteractable)
        if type == .filled {
            group.backgroundColor = UIColor.dl.mainCol()
            group.setBorder(width: 0, color: .white)
        }
        return group
    }
    
    private func configureStack() {
        stack.pin(to: self)
        for view in task.groups {
            let gr = getGroup(title: view)
            stack.addArrangedSubview(gr)
        }
        
        stack.axis = .horizontal
        stack.spacing = Constants.spacing
    }
}
