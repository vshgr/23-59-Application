//
//  TaskComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class TaskComponent: UIView {
    // MARK: - Constants
    enum Constants {
        static let done: UIImage? = UIImage(named: "done")
        static let add: UIImage? = UIImage(named: "addToGroup")
        static let mainSpacing: Double = 15
        static let cornerRadius: Double = 10
        static let taskColor: UIColor = UIColor(rgb: 0xF8F8F8)
        static let error: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private let selfTask: Bool
    private let taskView = UIView()
    private let buttonsSV = UIStackView()
    private let contentSV = UIStackView()
    private let permission = UILabel()
    private let taskName = UILabel()
    private let taskDesc = UILabel()
    private let groups = UILabel()
    private let bottomLineSV = UIStackView()
    private let dateView = BubbleComponent(text: "3 Dec, 2022")
    private let friend = FriendAccountSVConponent()
    private let doneBtn = UIButton()
    private let addBtn = UIButton()
    private let width: Double
    private var isDone = false
    
    // MARK: - Init
    init(frame: CGRect = .zero, isSelfTask: Bool = true) {
        selfTask = isSelfTask
        width = (Constants.add?.size.width ?? 26) / 2
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        addSubview(taskView)
        addSubview(buttonsSV)
        taskView.addSubview(contentSV)
        
        configurePermissionLabel()
        configureTaskNameLabel()
        configureGroupsLabel()
        configureBottomLineSV()
        configureContentSV()
        configureButtonsSV()
        configureButtons()
        configureConstraints()
        
        taskView.layer.cornerRadius = Constants.cornerRadius
        taskView.backgroundColor = Constants.taskColor
    }
    
    private func configureConstraints() {
        contentSV.pinVertical(to: taskView, Constants.mainSpacing)
        contentSV.pinHorizontal(to: taskView, Constants.mainSpacing)
        
        taskView.pinVertical(to: self)
        taskView.pinLeft(to: self)
        taskView.pinRight(to: self, width)
        buttonsSV.pinRight(to: self)
        buttonsSV.pinCenterY(to: taskView.centerYAnchor)
    }
    
    private func configurePermissionLabel() {
        permission.text = "private"
        permission.textColor = UIColor.dl.hintCol()
        permission.font = UIFont.dl.ralewayMedium(12)
    }
    
    private func configureTaskNameLabel() {
        taskName.text = "Разработать дизайн курсового проекта для приложения - тасктрекера"
        taskName.numberOfLines = 0
        taskName.textColor = .black
        taskName.font = UIFont.dl.ralewayBold(14)
    }
    
    private func configureGroupsLabel() {
        groups.text = "Курсовая работа, Диплом, Организация вечеринки"
        groups.numberOfLines = 0
        groups.textColor = UIColor.dl.hintCol()
        groups.font = UIFont.dl.ralewayMedium(14)
    }
    
    private func configureContentSV() {
        contentSV.axis = .vertical
        contentSV.spacing = Constants.mainSpacing
        
        for view in [friend, permission, taskName, bottomLineSV] {
            contentSV.addArrangedSubview(view)
        }
        
        if (selfTask == true) {
            friend.isHidden = true
        } else {
            permission.isHidden = true
        }
    }
    
    private func configureBottomLineSV() {
        bottomLineSV.axis = .horizontal
        bottomLineSV.spacing = Constants.mainSpacing
        
        for view in [dateView, groups] {
            bottomLineSV.addArrangedSubview(view)
        }
    }
    
    private func configureButtons(){
        doneBtn.setImage(Constants.done, for: .normal)
        addBtn.setImage(Constants.add, for: .normal)
        
        doneBtn.configuration = .plain()
        doneBtn.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.image = button.isHighlighted ? Constants.done : Constants.done
            config?.contentInsets = .zero
            button.configuration = config
        }
        
        doneBtn.addTarget(self, action: #selector(setDone(sender:)), for: .touchUpInside)
    }
    
    private func configureButtonsSV() {
        for view in [doneBtn, addBtn] {
            buttonsSV.addArrangedSubview(view)
        }
        
        buttonsSV.axis = .vertical
        buttonsSV.spacing = Constants.mainSpacing
    }
    
    // MARK: - Actions
    @objc
    private func setDone(sender: UIButton){
        isDone.toggle()
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            if (self.isDone == false) {
                self.doneBtn.alpha = 1
            } else {
                self.doneBtn.alpha = 0.3
            }
            self.doneBtn.transform = .identity
        })
    }
    
    // MARK: - Getters
    public func getTitle() -> String {
        return taskName.text ?? ""
    }
    
    public func getDesc() -> String {
        return taskDesc.text ?? ""
    }
    
    public func getDate() -> String {
        return dateView.getText()
    }
}
