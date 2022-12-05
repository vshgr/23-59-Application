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
        view.backgroundColor = UIColor(named: "mainColor")
        pinLogo()
    }
    
    private func pinLogo() {
        let parent = self.view!
        parent.addSubview(onloardingIconView)
        onloardingIconView.center = CGPoint(x: parent.frame.size.width / 2,
                                     y: parent.frame.size.height / 2 - parent.frame.size.height / 12 )
    }


}

