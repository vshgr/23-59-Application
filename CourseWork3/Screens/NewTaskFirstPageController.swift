//
//  NewTaskFirstPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//
import UIKit

class NewTaskFirstPageController: UIViewController, UITextViewDelegate {
    
    private let taskTitle: InputFieldView = InputFieldView(title: "Title", hint: "enter task name", message: "required")
    private let taskDate: InputFieldView = InputFieldView(title: "Deadline date", hint: "3 Dec, 2022", message: "required")
    private let taskTime: InputFieldView = InputFieldView(title: "Time", hint: "23:59", message: "required")
    
    private let descriptionField = UITextView()
    private let descriptionLabel = UILabel()
    private let descStack = UIStackView()
    private let continueButon = CustomButton(title: "Continue")
    
    private let contentStack = UIStackView()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        configureUI()
        setupNavBar(title: "New task", color: UIColor.dl.mainCol() ?? .white)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        
        for view in [contentStack, continueButon] {
            self.view.addSubview(view)
        }
        
        configureDescriptionLabel()
        configureDescriptionField()
        configureDescStack()
        configureContentStack()
        configureContinueButton()
        configureConstraints()
    }
    
    private func configureContentStack() {
        contentStack.axis = .vertical
        contentStack.spacing = 25
        
        for view in [taskTitle, descStack, taskDate, taskTime] {
            contentStack.addArrangedSubview(view)
        }
    }
    
    private func configureConstraints() {
        contentStack.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 17)
        contentStack.pinHorizontal(to: view, Grid.stripe)
        
        continueButon.pinHorizontal(to: view, Grid.stripe * 2)
        continueButon.pinBottom(to: view, Grid.stripe * 2)
    }
    
    private func configureContinueButton() {
        continueButon.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
    
    private func configureDescriptionField() {
        descriptionField.isSelectable = true
        descriptionField.isEditable = true
        
        descriptionField.text = "enter description"
        descriptionField.textColor = UIColor.dl.hintCol()
        descriptionField.font = UIFont.systemFont(ofSize: 15)
        
        descriptionField.setHeight(130)
        descriptionField.isScrollEnabled = true
        descriptionField.isUserInteractionEnabled = true
        descriptionField.backgroundColor = .clear
        descriptionField.layer.cornerRadius = 10
        descriptionField.setBorder(width: 1, color: .black)
        
        descriptionField.delegate = self
        descriptionField.textContainerInset = UIEdgeInsets(top: 11, left: 11, bottom: 11, right: 11)

    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.dl.ralewayMedium(14)
        descriptionLabel.textColor = .black
    }
    
    private func configureDescStack() {
        descStack.axis = .vertical
        descStack.spacing = 14
        
        for view in [descriptionLabel, descriptionField] {
            descStack.addArrangedSubview(view)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.dl.hintCol() {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.textColor != UIColor.black || textView.text == "" {
            textView.text = "enter description"
            textView.textColor = UIColor.dl.hintCol()
        }
    }
    
    @objc
    func continueButtonPressed() {
        continueButon.showAnimation {
            if self.taskTitle.getText() == "" {
                self.taskTitle.setErrorState()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                    self.taskTitle.setDefaultState()
                }
            } else {
                let secondPage = NewTaskSecondPageController()
                self.navigationController?.pushViewController(secondPage, animated: true)
            }
        }
    }
}
