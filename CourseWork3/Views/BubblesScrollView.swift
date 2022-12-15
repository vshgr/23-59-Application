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
    // MARK: - Constants
    enum Constants {
        static let height: Double = 40
    }
    
    // MARK: - Fields
    private let task = Task()
    private let stack = UIStackView()
    private var type = BubblesType.stroked
    private let isInteractable: Bool
    private let data: [String]
    private var bubblesData: [BubbleView]
    var onlyOneSelected = false
    
    // MARK: - Init
    init(frame: CGRect = .zero, type: BubblesType = .stroked, isInteractable: Bool = false, data: [String] = []) {
        self.type = type
        bubblesData = []
        self.isInteractable = isInteractable
        if data == [] {
            self.data = task.groups
        } else {
            self.data = data
        }
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configurations
    private func configureUI() {
        clipsToBounds = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        setHeight(Constants.height)
        
        addSubview(stack)
        stack.pinCenterY(to: centerYAnchor)
        
        configureStack()
    }
    
    private func getBubble(title: String) -> UIView {
        let group = BubbleView(text: title, isInteractable: isInteractable)
        if type == .filled {
            group.backgroundColor = UIColor.dl.mainCol()
            group.setBorder(width: 0, color: .white)
        }
        group.addTarget(self, action: #selector(setOnlyOneSelected(sender: )), for: .touchUpInside)
        bubblesData.append(group)
        return group
    }
    
    private func configureStack() {
        stack.pin(to: self)
        for view in data {
            let gr = getBubble(title: view)
            stack.addArrangedSubview(gr)
        }
        
        stack.axis = .horizontal
        stack.spacing = CommonConstants.horizontalStackSpacing
    }
    
    // MARK: - Functions
    func isSomeSelected() -> Bool {
        for bubble in bubblesData {
            if bubble.bubbleSelected == true {
                return true
            }
        }
        return false
    }
    
    // MARK: - Actions
    @objc
    func setOnlyOneSelected(sender: BubbleView) {
        if onlyOneSelected == true {
            for bubble in bubblesData {
                if bubble == sender {
                    continue
                } else {
                    if bubble.bubbleSelected == true {
                        bubble.setUnselected()
                    }
                }
            }
        }
    }
}
