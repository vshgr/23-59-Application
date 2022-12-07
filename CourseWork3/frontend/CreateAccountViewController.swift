//
//  CreateAccountView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 06.12.2022.
//

import UIKit

class CreateAccountViewController : UIViewController {
    let profileView = ProfileView()
    let stack = UIStackView()
        
    let nameField = InputFieldView(title: "Name", hint: "enter name", message: "")
    let usernameField = InputFieldView(title: "Username", hint: "enter username", message: "")
    let emailField = InputFieldView(title: "Email", hint: "example@email.com", message: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(named: "white")
        self.hideKeyboardWhenTappedAround()
        setupPhotoArea()
        setupCreateButton()
        setupFields()
    }
    
    private func setupPhotoArea() {
        view.addSubview(profileView)
        
        profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileView.pinTop(to: view.topAnchor, 131)
        profileView.tapChangePic = addPhotoButtonPressed
    }
    
    
    private func setupFields() {
        nameField.pinToParent(parent: self.view)
        usernameField.pinToParent(parent: self.view)
        emailField.pinToParent(parent: self.view)
        
        
        self.view.addSubview(stack)
        
        stack.axis = .vertical
        stack.spacing = 83
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(nameField)
        stack.addArrangedSubview(usernameField)
        stack.addArrangedSubview(emailField)
        
        stack.pinTop(to: profileView.bottomAnchor, 25)
        stack.pinHorizontal(to: view, Grid.stripe)
    }
    
    @objc
    private func addPhotoButtonPressed() {
        print("Hello")
        let popup = PhotoPicker(height: 0.5 * self.view.frame.size.height, width: self.view.frame.size.width - 2 * Grid.stripe)
        self.view.addSubview(popup)
        popup.center = self.view.center
    }
    
    private func setupCreateButton() {
        let btn = CustomButton(title: "Create account", height: view.frame.size.height)
        self.view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func createButtonPressed() {
        var flag = true
        if (nameField.getText().trimmingCharacters(in: .whitespaces) == ""){
            flag = false
            nameField.setErrorState()
        }
        if (usernameField.getText().trimmingCharacters(in: .whitespaces) == ""){
            flag = false
            usernameField.setErrorState()
        }
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            self.nameField.setDefaultState()
            self.usernameField.setDefaultState()
        }
        
        if(flag){
            //  navigationController?.pushViewController(codeInputController, animated: true)
        }
    }
    
}
