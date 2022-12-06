//
//  EmailViewController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 05.12.2022.
//

import UIKit

class InputField: UIViewController, UITextFieldDelegate {
    private let label = UILabel()
    private let input = UITextField()
    private let underline = UIView()
    private let errorMessage = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFeatures()
        setupInputEmail()
        setupUnderline()
        setupErrorMessage()
    }
    
    private func setupView() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
    }
    
    private func setupTextFeatures() {
        label.textColor = .black
        label.font = UIFont(name: "Raleway-Medium", size: 14)
        label.text = "Email"
        
        self.view.addSubview(label)
        
        let grid = Grid(view: self.view)
        label.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 1.1 * self.view.center.y])
    }
    
    @objc func myTargetFunction(textField: UITextField) {
        setDefaultState()
    }
    
    private func setupInputEmail() {
        input.textColor = .black
        input.attributedPlaceholder = NSAttributedString(
            string: "enter email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "hintColor")!]
        )
        input.font = UIFont(name: "Raleway-Medium", size: 15)
        
        self.view.addSubview(input)
        input.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        
        let grid = Grid(view: self.view)
        input.pin(to: self.view, [.left: grid.pin])
        input.pin(to: label, [.top: (Double)(label.font!.pointSize) + 14])
    }
    
    private func setupUnderline() {
        let grid = Grid(view: self.view)
        self.view.addSubview(underline)
        underline.setHeight(to: 1)
        underline.backgroundColor = UIColor(named: "black")
        underline.pin(to: self.view, [.left: grid.pin, .right: grid.pin])
        underline.pin(to: input, [.top: (Double)(input.font!.pointSize) + 11])
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
    
    private func setErrorState() {
        input.textColor = UIColor(named: "attentionColor")
        label.textColor = UIColor(named: "attentionColor")
        underline.backgroundColor = UIColor(named: "attentionColor")
        
        errorMessage.isHidden = false
        input.attributedPlaceholder = NSAttributedString(
            string: "enter email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "attentionColor")!]
        )
    }
    
    private func setDefaultState() {
        input.attributedPlaceholder = NSAttributedString(
            string: "enter email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "hintColor")!]
        )
        errorMessage.isHidden = true
        input.textColor = UIColor(named: "black")
        label.textColor = UIColor(named: "black")
        underline.backgroundColor = UIColor(named: "black")
    }
}
