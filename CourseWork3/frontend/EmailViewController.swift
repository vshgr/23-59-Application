//
//  EmailViewController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 05.12.2022.
//

import UIKit

class EmailViewController: UIViewController {
    private let emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
    }
    
    private func setupTextFeatures() {
        emailLabel.textColor = .black
        let fontDescriptor = UIFont(name: "Raleway-Medium", size: 14)!.fontDescriptor
        emailLabel.text = "Email"
        emailLabel.font = UIFont(descriptor: fontDescriptor, size: 14)
        
        view.addSubview(emailLabel)
        emailLabel.pinCenter(to: self.view.centerXAnchor)
    }
    
}
