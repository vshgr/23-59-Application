//
//  ViewController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 30.11.2022.
//

import UIKit

class ViewController: UIViewController {
    let onloardingIconView = UIImageView(image: UIImage(named: "onboarding_logo"))
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(named: "mainColor")
        pinLogo()
        configureButton()
    }
    
    private func pinLogo() {
        self.view.addSubview(onloardingIconView)
        onloardingIconView.center = CGPoint(x: view.frame.size.width / 2,
                                            y: view.frame.size.height / 2 - view.frame.size.height / 12 )
    }
    
    private func configureButton() {
        let grid = Grid(view: self.view)
        
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(UIColor(named: "white"), for: .normal)
        button.titleLabel?.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 18)
        button.backgroundColor = UIColor(named: "black")
        self.view.addSubview(button)
        
        button.setHeight(to: view.frame.size.height * 0.08)
        button.layer.cornerRadius = view.frame.size.height * 0.08 / 2
        
        button.pin(to: self.view, [.left: grid.margin * 2, .right: grid.margin * 2, .bottom: grid.margin * 2])
        
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func signInButtonPressed() {
        let emailViewController = EmailViewController()
        navigationController?.pushViewController(emailViewController, animated: true)
    }
    
}

