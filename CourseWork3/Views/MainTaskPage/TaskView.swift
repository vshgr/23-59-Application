//
//  TaskComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 08.12.2022.
//

import UIKit

class TaskView: UIView {
    // MARK: - Constants
    enum Constants {
        static let done: UIImage? = UIImage(named: "done")
        static let add: UIImage? = UIImage(named: "addToGroup")
        static let taskColor: UIColor = UIColor(rgb: 0xF8F8F8)
        static let separator: String = ", "
    }
    
    // MARK: - Fields
    private let task: Task = Task()
    private let selfTask: Bool
    private let taskView = UIView()
    private let buttonsSV = UIStackView()
    private let contentSV = UIStackView()
    private let permission = UILabel()
    private let taskName = UILabel()
    private let taskDesc = UILabel()
    private let groups = UILabel()
    private let bottomLineSV = UIStackView()
    private var dateView = BubbleView()
    private let friend = FriendAccountSVConponent()
    private let doneBtn = UIButton()
    private let addBtn = UIButton()
    private let width: Double
    private var isDone = false
    var taskClicked: (() -> Void)?
    
    // MARK: - Init
    init(frame: CGRect = .zero, isSelfTask: Bool = true) {
        selfTask = isSelfTask
        width = (Constants.add?.size.width ?? 26) / 2
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openTask))
        gesture.numberOfTapsRequired = 1
        taskView.addGestureRecognizer(gesture)
        
        dateView = BubbleView(text: task.deadline)
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
        
        taskView.layer.cornerRadius = CommonConstants.cornerRadius
        taskView.backgroundColor = Constants.taskColor
    }
    
    private func configureConstraints() {
        contentSV.pinVertical(to: taskView, CommonConstants.smallContentSpacing)
        contentSV.pinHorizontal(to: taskView, CommonConstants.smallContentSpacing)
        
        taskView.pinVertical(to: self)
        taskView.pinLeft(to: self)
        taskView.pinRight(to: self, width)
        buttonsSV.pinRight(to: self)
        buttonsSV.pinCenterY(to: taskView.centerYAnchor)
    }
    
    private func configurePermissionLabel() {
        permission.text = task.permission.rawValue
        permission.textColor = UIColor.dl.hintCol()
        permission.font = UIFont.dl.ralewayMedium(12)
    }
    
    private func configureTaskNameLabel() {
        taskName.text = task.name
        taskName.numberOfLines = CommonConstants.multiline
        taskName.textColor = .black
        taskName.font = UIFont.dl.ralewayBold(14)
    }
    
    private func configureGroupsLabel() {
        groups.text = task.groups.joined(separator: Constants.separator)
        groups.numberOfLines = CommonConstants.multiline
        groups.textColor = UIColor.dl.hintCol()
        groups.font = CommonConstants.mainLabelFont
    }
    
    private func configureContentSV() {
        contentSV.axis = .vertical
        contentSV.spacing = CommonConstants.contentStackSpacing
        
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
        bottomLineSV.spacing = CommonConstants.horizontalStackSpacing
        bottomLineSV.alignment = .center
        
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
        
        doneBtn.addTarget(self, action: #selector(setDone), for: .touchUpInside)
    }
    
    private func configureButtonsSV() {
        for view in [doneBtn, addBtn] {
            buttonsSV.addArrangedSubview(view)
        }
        
        buttonsSV.axis = .vertical
        buttonsSV.spacing = CommonConstants.contentStackSpacing
    }
    
    // MARK: - Actions
    @objc
    private func setDone(){
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
    
    // MARK: - Actions
    @objc
    func openTask() {
        taskClicked?()
    }
}
