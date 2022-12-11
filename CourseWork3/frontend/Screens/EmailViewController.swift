import UIKit

class EmailViewController: UIViewController {
    
    // MARK: - Fields
    private let emailField: InputFieldView = InputFieldView(title: "Email", hint: "enter email", message: "invalid email")
    let btn = CustomButton(title: "Send code", height: 70)

    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar(hideBack: true)
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
        
        btn.addTarget(self, action: #selector(sendCodeButtonPressed), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc
    private func sendCodeButtonPressed() {
        btn.showAnimation {
            let mailer = Mailer()
            if (mailer.checkIfEmailFilled(email: self.emailField.getText())) {
                let codeInputController = CodeInputController()
                self.navigationController?.pushViewController(codeInputController, animated: true)
            } else {
                self.emailField.setErrorState()
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                    self.emailField.setDefaultState()
                }
            }
        }
    }
}


