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
        let grid = Grid(view: self.view)
        emailField.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 1.1 * self.view.center.y])
    }


    private func setupSendCodeButton() {
        let grid = Grid(view: self.view)
        let btn = CustomButton(title: "Send code", height: view.frame.size.height)
        self.view.addSubview(btn)

        btn.pin(to: self.view, [.left: grid.margin * 2, .right: grid.margin * 2, .bottom: grid.margin * 2])
        
        btn.addTarget(self, action: #selector(sendCodeButtonPressed), for: .touchUpInside)
    }

    @objc
    private func sendCodeButtonPressed() {
        let mailer = Mailer()
        if (mailer.checkIfEmailFilled(email: emailField.getText())) {
            let codeInputController = CodeInputViewController()
            navigationController?.pushViewController(codeInputController, animated: true)
        } else {
            emailField.setErrorState()
        }
    }
    
    private func setErrorState() {
        emailInput.textColor = UIColor(named: "attentionColor")
        emailLabel.textColor = UIColor(named: "attentionColor")
        underline.backgroundColor = UIColor(named: "attentionColor")
        
        errorMessage.isHidden = false
        emailInput.attributedPlaceholder = NSAttributedString(
            string: "enter email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "attentionColor") ?? .red]
        )
    }
    
    private func setDefaultState() {
        emailInput.attributedPlaceholder = NSAttributedString(
            string: "enter email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "hintColor") ?? .gray]
        )
        errorMessage.isHidden = true
        emailInput.textColor = UIColor(named: "black")
        emailLabel.textColor = UIColor(named: "black")
        underline.backgroundColor = UIColor(named: "black")
    }

}


