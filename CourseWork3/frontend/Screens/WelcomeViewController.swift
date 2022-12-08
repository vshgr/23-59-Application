//
//  ViewController.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 30.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - Fields
    let onboardingIconView = UIImageView(image: UIImage(named: "onboarding_logo"))  
    
    // MARK: - Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = UIColor.dl.mainCol()
        pinLogo()
        configureButton()
    }
    
    private func configureButton() {
        let btn = CustomButton(title: "Sign in", height: view.frame.size.height)
        view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
    }
    
    private func pinLogo() {
        view.addSubview(onboardingIconView)
        onboardingIconView.pinCenterX(to: view.centerXAnchor)
        onboardingIconView.pinCenterY(to: view.centerYAnchor, -70)
    }
    
    // MARK: - Actions
    @objc
    private func signInButtonPressed() {
        let emailViewController = EmailViewController()
        navigationController?.pushViewController(emailViewController, animated: true)
//        let tasks = MainTasksPageController()
//        navigationController?.pushViewController(tasks, animated: true)
    }
    
}

