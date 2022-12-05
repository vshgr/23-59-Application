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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFeatures()
        setupInputEmail()
        setupSendCodeButton()
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
        
        emailLabel.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 493])
    }
    
    private func setupInputEmail() {
        emailInput.textColor = .black
        emailInput.placeholder = "enter email"
        emailInput.font = UIFont(name: "Raleway-Medium", size: 15)
        
        self.view.addSubview(emailInput)
        
        let grid = Grid(view: self.view)
        emailInput.pin(to: self.view, [.left: grid.pin, .bottom: 461])
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
        let codeInputController = CodeInputViewController()
        navigationController?.pushViewController(codeInputController, animated: true)
    }
}
