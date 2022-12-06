//
//  CreateAccountView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 06.12.2022.
//

import UIKit

class CreateAccountViewController : UIViewController {
    var photoArea = UIImageView()
    let createButton = UIButton()
    let addPhotoButtonView = UIButton()
    let addPhotoIconView = UIImageView(image: UIImage(named: "photo"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(named: "white")
        setupPhotoPicker()
        setupCreateButton()
        setupAddPhotoView()
    }
    
    private func setupPhotoPicker() {
        self.view.addSubview(photoArea)
        
        photoArea.backgroundColor = UIColor(named: "mainColor")

        photoArea.setWidth(to: 146)
        photoArea.setHeight(to: 146)
        
        photoArea.layer.cornerRadius = 146/2
        photoArea.pin(to: self.view, [.top: 131])
        photoArea.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
    }
    
    private func setupAddPhotoView() {
        let buttonLabel = UILabel()
        
        addPhotoButtonView.addSubview(buttonLabel)
        addPhotoButtonView.addSubview(addPhotoIconView)
        photoArea.addSubview(addPhotoButtonView)
        
        addPhotoButtonView.pinTop(to: photoArea.bottomAnchor, 15)
        addPhotoButtonView.setWidth(to: 102)
        addPhotoButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        buttonLabel.text = "add photo"
        buttonLabel.textColor = UIColor(named: "violet")
        buttonLabel.font = UIFont(name: "Raleway-Medium", size: 15)
        
        addPhotoIconView.pinRight(to: addPhotoButtonView)
        buttonLabel.pinLeft(to: addPhotoButtonView)
        buttonLabel.centerYAnchor.constraint(equalTo: addPhotoIconView.centerYAnchor).isActive = true
        
        addPhotoButtonView.addTarget(self, action: #selector(addPhotoButtonPressed), for: .touchUpInside)
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
        //        navigationController?.pushViewController(codeInputController, animated: true)
    }
    
}
