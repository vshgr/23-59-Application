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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextFeatures()
        setupInputEmail()
    }
    
    private func setupView() {
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .white
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
}
