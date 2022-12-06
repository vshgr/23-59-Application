//
//  CreateAccountView.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 06.12.2022.
//

import UIKit

class CreateAccountViewController : UIViewController {
    var photoArea = UIView()
    let createButton = UIButton()
    let addPhotoButtonView = UIView()
    
    let iconView = UIImageView(image: UIImage(named: "logo"))
    let addPhotoView = UIImageView(image: UIImage(named: "logo"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(named: "white")
        setupPhotoPicker()
        setupCreateButton()
    }
    
    private func setupPhotoPicker() {
        self.view.addSubview(photoArea)
        
        photoArea.backgroundColor = UIColor(named: "mainColor")
        photoArea.addSubview(iconView)
        photoArea.setWidth(to: 146)
        photoArea.setHeight(to: 146)
        photoArea.layer.cornerRadius = photoArea.frame.size.height/2
        photoArea.pinTop(to: self.view)
        
    }
    
    private func setupCreateButton() {
        let grid = Grid(view: self.view)
        
        createButton.setTitle("Create account", for: .normal)
        createButton.setTitleColor(UIColor(named: "white"), for: .normal)
        createButton.titleLabel?.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 18)
        createButton.backgroundColor = UIColor(named: "black")
        self.view.addSubview(createButton)
        
        createButton.setHeight(to: view.frame.size.height * 0.08)
        createButton.layer.cornerRadius = view.frame.size.height * 0.08 / 2
        
        createButton.pin(to: self.view, [.left: grid.margin * 2, .right: grid.margin * 2, .bottom: grid.margin * 2])
        
        createButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func createButtonPressed() {
        //        navigationController?.pushViewController(codeInputController, animated: true)
    }
    
}
