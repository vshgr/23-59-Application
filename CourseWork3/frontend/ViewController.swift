//
//  ViewController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 30.11.2022.
//

import UIKit

class ViewController: UIViewController {
    let onloardingIconView = UIImageView(image: UIImage(named: "onboarding_logo"))  
    
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
        let btn = CustomButton(title: "Sign in", height: view.frame.size.height)
        self.view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func signInButtonPressed() {
        let emailViewController = EmailViewController()
        navigationController?.pushViewController(emailViewController, animated: true)
    }
    
}

