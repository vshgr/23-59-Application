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
        static let topSpacing: Double = 131
    }
    
    // MARK: - Fields
    let profileView = ProfileView()
    let stack = UIStackView()
    var nameField = InputFieldView(title: "Name", hint: "enter name", message: "required")
    let usernameField = InputFieldView(title: "Username", hint: "enter username", message: "required")
    var emailField = InputFieldView(title: "Email", hint: "example@hse.ru")
    let btn = ButtonView(title: "Create account")
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar(title: "Create account")
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        profileView.pinTop(to: view.topAnchor, Constants.topSpacing)
        profileView.tapChangePic = addPhotoButtonPressed
    }
    
    private func setupFields() {
        view.addSubview(stack)
        
        stack.axis = .vertical
        stack.spacing = CommonConstants.contentStackSpacing
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(nameField)
        stack.addArrangedSubview(usernameField)
        stack.addArrangedSubview(emailField)
        
        stack.pinTop(to: profileView.bottomAnchor, CommonConstants.contentStackSpacing)
        stack.pinHorizontal(to: view, Grid.stripe)
    }
    
    private func setupCreateButton() {
        view.addSubview(btn)
        
        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        btn.buttonClicked = createButtonPressed
    }
    
    // MARK: - Actions
    @objc
    private func addPhotoButtonPressed() {
        let popup = PhotoPickerController()
        present(popup, animated: true, completion: nil)
    }
    
    @objc
    private func createButtonPressed() {
        btn.showAnimation { [self] in
            var flag = true
            
            if (!nameField.checkInputCorrect(type: InputType.normal, value: nameField.getText())){
                flag = false
                self.nameField.setErrorState()
            }
            
            if (!usernameField.checkInputCorrect(type: InputType.username, value: usernameField.getText())){
                flag = false
                self.usernameField.setErrorMessage(message: "from 5 to 18 simbols without special")
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
