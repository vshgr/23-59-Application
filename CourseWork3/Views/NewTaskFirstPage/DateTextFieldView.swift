import UIKit

class DateTextFieldView: UITextField {
    
    // MARK: - Constants
    enum Constants {
        static let error: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private let datePicker = UIDatePicker()
    
    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureUI()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureDeadlineDate()
    }
    
    private func configureText() {
        textColor = .black
        font = .systemFont(ofSize: 15)
    }
    
    private func configureDeadlineDate() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged), for: UIControl.Event.valueChanged)
        
        inputView = datePicker
        text = formatDate(date: Date())
    }
    
    // MARK: - Formatter
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, yyyy"
        return formatter.string(from: date)
    }
    
    // MARK: - Actions
    @objc
    private func dateChanged() {
        text = formatDate(date: datePicker.date)
    }
}
