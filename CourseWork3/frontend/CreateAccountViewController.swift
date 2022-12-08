//
//  CreateAccountView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 06.12.2022.
//

import UIKit

class CreateAccountViewController : UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let spacing: Double = 25
    }
    
    // MARK: - Fields
    let profileView = ProfileView()
    let stack = UIStackView()
        
    let nameField = InputFieldView(title: "Name", hint: "enter name", message: "")
    let usernameField = InputFieldView(title: "Username", hint: "enter username", message: "")
    let emailField = InputFieldView(title: "Email", hint: "example@email.com", message: "")
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = UIColor(named: "white")
        emailField.isUserInteractionEnabled = false
        hideKeyboardWhenTappedAround()
        setupPhotoArea()
        setupCreateButton()
        setupFields()
    }
    
    private func setupPhotoArea() {
        view.addSubview(profileView)
        
        profileView.pinCenterX(to: view.centerXAnchor)
        profileView.pinTop(to: view.topAnchor, 131)
        profileView.tapChangePic = addPhotoButtonPressed
    }
    
    private func setupFields() {
        nameField.pinToParent(parent: view)
        usernameField.pinToParent(parent: view)
        emailField.pinToParent(parent: view)
        
        view.addSubview(stack)
        
        stack.axis = .vertical
        stack.spacing = Constants.spacing
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(nameField)
        stack.addArrangedSubview(usernameField)
        stack.addArrangedSubview(emailField)
        
        stack.pinTop(to: profileView.bottomAnchor, Constants.spacing)
        stack.pinHorizontal(to: view, Grid.stripe)
    }
    
    private func setupCreateButton() {
        let btn = CustomButton(title: "Create account", height: view.frame.size.height)
        view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func addPhotoButtonPressed() {
        let popup = PhotoPickerController()
        self.present(popup, animated: true, completion: nil)
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
            let mainTasksController = MainTasksPageController()
            navigationController?.pushViewController(mainTasksController, animated: true)
        }
    }
    
}
