//
//  TimeTextFieldView.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 15.12.2022.
//

import UIKit

class TimeTextFieldView: UITextField {
    // MARK: - Fields
    private let timePicker = UIDatePicker()
    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(CommonConstants.errorMessage)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureDeadlineTime()
    }
    
    private func configureDeadlineTime() {
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(timeChanged), for: UIControl.Event.valueChanged)
        timePicker.locale = Locale(identifier: "ru")
        timePicker.date = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: Date()) ?? Date()
        
        inputView = timePicker
        text = formatTime(date: timePicker.date)
    }
    
    // MARK: - Formatter
    private func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    // MARK: - Actions
    @objc
    private func timeChanged() {
        text = formatTime(date: timePicker.date)
    }
}
