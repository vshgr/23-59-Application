import UIKit

class EmailViewController: UIViewController {
    
    // MARK: - Fields
    private let emailField: InputFieldView = InputFieldView(title: "Email", hint: "enter email", message: "invalid email", keyboard: UIKeyboardType.emailAddress)
    let btn = ButtonView(title: "Send code")

    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }

    // MARK: - Setups
    private func setupView() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()

        setupField()
        setupSendCodeButton()
    }
    
    private func setupField(){
        view.addSubview(emailField)
        emailField.pinHorizontal(to: view, Grid.stripe)
        emailField.pinCenterY(to: view.centerYAnchor)
    }

    private func setupSendCodeButton() {
        self.view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.buttonClicked = sendCodeButtonPressed
    }

    // MARK: - Actions
    @objc
    private func sendCodeButtonPressed() {
        btn.showAnimation { [self] in
            if (emailField.checkInputCorrect(type: InputType.email, value: emailField.getText())) {
                let codeInputController = CodeInputController()
                navigationController?.pushViewController(codeInputController, animated: true)
            } else {
                emailField.setErrorState()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                    self.emailField.setDefaultState()
                }
            }
        }
    }
}


