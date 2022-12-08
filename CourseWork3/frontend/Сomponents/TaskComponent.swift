//
//  TaskComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class TaskComponent: UIView {
    private let view = UIView()
    private let buttonsSV = UIStackView()
    private let permission = UILabel()
    private let taskName = UILabel()
    private let taskDesc = UILabel()
    private let groups = UILabel()
    
    // CДЕЛАТЬ КАСТОМНЫЙ
    private let dateView = UIView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
    }
    
    
}
