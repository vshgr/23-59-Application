//
//  EmailViewController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 05.12.2022.
//

import UIKit

class EmailViewController: UIViewController {
    private let emailLabel = UILabel()
    private let emailInput = UITextField()
    private let codeButton = UIButton()
    private let underline = UIView()
    private let errorMessage = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFeatures()
        setupInputEmail()
        setupSendCodeButton()
        setupUnderline()
        setupErrorMessage()
    }
    
    private func setupView() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setupTextFeatures() {
        emailLabel.textColor = .black
        emailLabel.font = UIFont(name: "Raleway-Medium", size: 14)
        emailLabel.text = "Email"
        
        self.view.addSubview(emailLabel)
        
        let grid = Grid(view: self.view)

        // ВОТ ТУТ ПИН ОТНОСИТЕЛЬНО ЭКРАНА ДЛЯ ЛЕЙБЛОВ (Я сделала так что лейбл начинается относительно экрана в середине по высоте экрана (адаптивная верстка хули))
        emailLabel.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 1.1 * self.view.center.y])
    }
    
    private func setupUnderline() {
        let grid = Grid(view: self.view)
        self.view.addSubview(underline)
        underline.setHeight(to: 1)
        underline.backgroundColor = UIColor(named: "black")
        underline.pin(to: self.view, [.left: grid.pin, .right: grid.pin])
        // тут короче чтобы задавать растояние до следующего элемента ты его пинишь к элементу выше и задаешь значение = размер шрифта + расстояние из фигмы (например тут размер шрифта элемента: расстояние от emailInput до линни - 11, то есть значение font.pointSize + 11)
        underline.pin(to: emailInput, [.top: (Double)(emailInput.font!.pointSize) + 11])
    }
    
    private func setupErrorMessage(){
        let grid = Grid(view: self.view)
        self.view.addSubview(errorMessage)
        errorMessage.text = "incorrect email"
        errorMessage.textColor = UIColor(named: "attentionColor")
        errorMessage.font = UIFont(name: "Raleway-Medium", size: 15)
        errorMessage.pin(to: self.view, [.left: grid.pin, .right: grid.pin])
        errorMessage.pin(to: underline, [.top: 8])
        errorMessage.isHidden = true
    }
    
    private func setupInputEmail() {
        emailInput.textColor = .black
        emailInput.attributedPlaceholder = NSAttributedString(
            string: "enter email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "hintColor")!]
        )
        emailInput.font = UIFont(name: "Raleway-Medium", size: 15)
        
        self.view.addSubview(emailInput)
        
        let grid = Grid(view: self.view)
        emailInput.pin(to: self.view, [.left: grid.pin])
        emailInput.pin(to: emailLabel, [.top: (Double)(emailLabel.font!.pointSize) + 14])
    }
    
    private func setupSendCodeButton() {
        let grid = Grid(view: self.view)
        
        codeButton.setTitle("Send code", for: .normal)
        codeButton.setTitleColor(UIColor(named: "white"), for: .normal)
        codeButton.titleLabel?.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 18)
        codeButton.backgroundColor = UIColor(named: "black")
        self.view.addSubview(codeButton)
        
        codeButton.setHeight(to: view.frame.size.height * 0.08)
        codeButton.layer.cornerRadius = view.frame.size.height * 0.08 / 2
        
        codeButton.pin(to: self.view, [.left: grid.margin * 2, .right: grid.margin * 2, .bottom: grid.margin * 2])
        
        codeButton.addTarget(self, action: #selector(sendCodeButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func sendCodeButtonPressed() {
        let mailer = Mailer()
        if (mailer.checkIfEmailFilled(email: emailInput.text ?? "")) {
            let codeInputController = CodeInputViewController()
            navigationController?.pushViewController(codeInputController, animated: true)
        } else {
            emailInput.textColor = UIColor(named: "attentionColor")
            emailLabel.textColor = UIColor(named: "attentionColor")
            underline.backgroundColor = UIColor(named: "attentionColor")
            
            errorMessage.isHidden = false
            emailInput.attributedPlaceholder = NSAttributedString(
                string: "enter email",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "attentionColor")!]
            )
            
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
                self.emailInput.attributedPlaceholder = NSAttributedString(
                    string: "enter email",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "hintColor")!]
                )
                self.errorMessage.isHidden = true
                self.emailInput.textColor = UIColor(named: "black")
                self.emailLabel.textColor = UIColor(named: "black")
                self.underline.backgroundColor = UIColor(named: "black")
            }
        }
        
    }
}
