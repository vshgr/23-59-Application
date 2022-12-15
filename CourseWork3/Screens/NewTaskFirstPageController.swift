//
//  NewTaskFirstPageController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 13.12.2022.
//
import UIKit

class NewTaskFirstPageController: UIViewController, UITextViewDelegate {
    // MARK: - Fields
    private let taskTitle: InputFieldView = InputFieldView(title: "Title", hint: "enter task name", message: "required")
    private var taskDate: InputFieldView = InputFieldView(title: "Deadline date", hint: "3 Dec, 2022", message: "required")
    private let taskTime: InputFieldView = InputFieldView(title: "Time", hint: "23:59", message: "required")
    
    private let descriptionField = UITextView()
    private let descriptionLabel = UILabel()
    private let descStack = UIStackView()
    private let continueButon = ButtonView(title: "Continue")
    
    private let contentStack = UIStackView()
    
    private let datePicker = UIDatePicker()
    private let timePicker = UIDatePicker()
    
    // MARK: - Load
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
    
    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .white
        
        
        for view in [contentStack, continueButon] {
            self.view.addSubview(view)
        }
        
        configureDescriptionLabel()
        configureDescriptionField()
        configureDeadlineDate()
        configureDeadlineTime()
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
        continueButon.buttonClicked = continueButtonPressed
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
    
    private func configureDeadlineDate() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: UIControl.Event.valueChanged)
        
        taskDate.input.inputView = datePicker
        taskDate.input.text = formatDate(date: Date())
    }
    
    private func configureDeadlineTime() {
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(timeChanged), for: UIControl.Event.valueChanged)
        timePicker.locale = Locale(identifier: "ru")
        timePicker.date = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: Date()) ?? Date()
        
        taskTime.input.inputView = timePicker
        taskTime.input.text = formatTime(date: timePicker.date)
    }
    
    // MARK: - Formatter
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, yyyy"
        return formatter.string(from: date)
    }
    
    private func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    // MARK: - Actions
    @objc
    private func dateChanged() {
        taskDate.input.text = formatDate(date: datePicker.date)
    }
    
    @objc
    private func timeChanged() {
        taskTime.input.text = formatTime(date: timePicker.date)
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
    
    // MARK: - Extras
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
}
