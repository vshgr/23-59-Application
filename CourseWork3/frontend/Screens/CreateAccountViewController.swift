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
    var nameField = InputFieldView(title: "Name", hint: "enter name", message: "required")
    let usernameField = InputFieldView(title: "Username", hint: "enter username", message: "required")
    var emailField: InputFieldView = InputFieldView()
    let btn = CustomButton(title: "Create account", height: 70)
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .white
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
        btn.showAnimation {
            var flag = true
            
            if (self.nameField.getText().trimmingCharacters(in: .whitespaces) == ""){
                flag = false
                self.nameField.setErrorState()
            }
            
            if (self.usernameField.getText().trimmingCharacters(in: .whitespaces) == ""){
                flag = false
                self.usernameField.setErrorState()
            }
            
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                self.nameField.setDefaultState()
                self.usernameField.setDefaultState()
            }
            
            if(flag){
                let pages = CustomTabBarController()
                self.navigationController?.pushViewController(pages, animated: true)
            }
        }
    }
    
}
