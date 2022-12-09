import UIKit

class EmailViewController: UIViewController {
    
    // MARK: - Fields
    private let emailField: InputFieldView = InputFieldView(title: "Email", hint: "enter email", message: "invalid email")
    let btn = CustomButton(title: "Send code", height: 70)
    weak var delegate: EmailDelegate?

    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
        emailField.pinToParent(parent: self.view)
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
                self.delegate?.emailInserted(self.emailField.getText())
                let codeInputController = CodeInputViewController()
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


