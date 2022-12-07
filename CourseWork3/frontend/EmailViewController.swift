import UIKit

class EmailViewController: UIViewController {    
    private let emailField: InputFieldView = {
        let ifv = InputFieldView(title: "Email", hint: "enter email", message: "invalid email")
        ifv.setDefaultState()
        return ifv
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .white

        setupField()
        setupSendCodeButton()
    }
    
    private func setupField(){
        self.view.addSubview(emailField)
        self.hideKeyboardWhenTappedAround()
        emailField.pinToParent(parent: self.view)
        emailField.pinLeft(to: view, Grid.stripe)
        emailField.pinBottom(to: view,  1.1 * self.view.center.y)
    }


    private func setupSendCodeButton() {
        let btn = CustomButton(title: "Send code", height: view.frame.size.height)
        self.view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(sendCodeButtonPressed), for: .touchUpInside)
    }

    @objc
    private func sendCodeButtonPressed() {
//        let mailer = Mailer()
//        if (mailer.checkIfEmailFilled(email: emailField.getText())) {
//            let codeInputController = CodeInputViewController()
//            navigationController?.pushViewController(codeInputController, animated: true)
//        } else {
//            emailField.setErrorState()
//        }
//
        let codeInputController = CreateAccountViewController()
        navigationController?.pushViewController(codeInputController, animated: true)
    }

}


