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
    let btn = CustomButton(title: "Sign in", height: 70)
    
    // MARK: - Load
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = UIColor.dl.mainCol()
        pinLogo()
        configureButton()
    }
    
    private func configureButton() {
        view.addSubview(btn)

        btn.pinHorizontal(to: view, Grid.stripe * 2)
        btn.pinBottom(to: view, Grid.stripe * 2)
        
        btn.buttonClicked = signInButtonPressed
    }
    
    private func pinLogo() {
        view.addSubview(onboardingIconView)
        onboardingIconView.pinCenterX(to: view.centerXAnchor)
        onboardingIconView.pinCenterY(to: view.centerYAnchor, -70)
    }
    
    // MARK: - Actions
    @objc
    private func signInButtonPressed() {
        btn.showAnimation {
            let emailViewController = EmailViewController()
            self.navigationController?.pushViewController(emailViewController, animated: true)
        }
//        btn.showAnimation {
//            let tasks = MainTasksPageController()
//            self.navigationController?.pushViewController(tasks, animated: true)
//        }
//        btn.showAnimation {
//            let tasks = CreateAccountViewController()
//            self.navigationController?.pushViewController(tasks, animated: true)
//        }
//        let emailViewController = CodeInputViewController()
//        navigationController?.pushViewController(emailViewController, animated: true)
    }
    
}

