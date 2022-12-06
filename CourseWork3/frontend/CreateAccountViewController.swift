//
//  CreateAccountView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 06.12.2022.
//

import UIKit

class CreateAccountViewController : UIViewController {
    var photoArea = UIImageView()
    let addPhotoButtonView = UIButton()
    let addIcon = UIImageView(image: UIImage(named: "photo"))
    
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
        setupAddPhotoView()
        setupFields()
    }
    
    private func setupPhotoArea() {
        self.view.addSubview(photoArea)
        
        photoArea.backgroundColor = UIColor(named: "mainColor")

        photoArea.setWidth(to: 146)
        photoArea.setHeight(to: 146)
        
        photoArea.layer.cornerRadius = 146/2
        photoArea.pin(to: self.view, [.top: 131])
        photoArea.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        let logoImage = UIImage(named: "logo")
        photoArea.image = logoImage
        photoArea.contentMode = .center
    }
    
    private func setupAddPhotoView() {
        let buttonLabel = UILabel()
        
        addPhotoButtonView.addSubview(buttonLabel)
        addPhotoButtonView.addSubview(addIcon)
        photoArea.addSubview(addPhotoButtonView)
        
        addPhotoButtonView.pinTop(to: photoArea.bottomAnchor, 15)
        addPhotoButtonView.setWidth(to: 102)
        addPhotoButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        buttonLabel.text = "add photo"
        buttonLabel.textColor = UIColor(named: "violet")
        buttonLabel.font = UIFont(name: "Raleway-Medium", size: 15)
        
        addIcon.pinRight(to: addPhotoButtonView)
        buttonLabel.pinLeft(to: addPhotoButtonView)
        buttonLabel.centerYAnchor.constraint(equalTo: addIcon.centerYAnchor).isActive = true
        
        addPhotoButtonView.addTarget(self, action: #selector(addPhotoButtonPressed), for: .touchUpInside)
    }
    
    private func setupFields() {
        nameField.pinToParent(parent: self.view)
        usernameField.pinToParent(parent: self.view)
        emailField.pinToParent(parent: self.view)
        
        
        let stack = UIStackView()
        let grid = Grid(view: self.view)
        self.view.addSubview(stack)
        
        stack.axis = .vertical
        stack.spacing = 83
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(nameField)
        stack.addArrangedSubview(usernameField)
        stack.addArrangedSubview(emailField)
        
        stack.pinTop(to: addPhotoButtonView.bottomAnchor, 23)
        stack.pin(to: self.view, [.left: grid.pin])
    
    }
    
    @objc
    private func addPhotoButtonPressed() {
        //TODO: ПИКЕР ФОТО
    }
    
    private func setupCreateButton() {
        let grid = Grid(view: self.view)
        let btn = CustomButton(title: "Create account", height: view.frame.size.height)
        self.view.addSubview(btn)
        btn.pin(to: self.view, [.left: grid.margin * 2, .right: grid.margin * 2, .bottom: grid.margin * 2])
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
