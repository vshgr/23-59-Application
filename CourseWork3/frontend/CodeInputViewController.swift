//
//  CodeInputViewController.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 05.12.2022.
//

extension UIView {
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

import UIKit

class CodeInputViewController: UIViewController {
    private let checkEmailLabel = UILabel()
    private let codeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTextLabels()
        setupInput()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
    }
    
    private func setupTextLabels() {
        codeLabel.textColor = .black
        codeLabel.font = UIFont(name: "Raleway-Medium", size: 14)
        codeLabel.text = "Code"
        
        self.view.addSubview(codeLabel)
        
        let grid = Grid(view: self.view)
        
        codeLabel.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 493])
        
        // New label
        checkEmailLabel.textColor = .black
        checkEmailLabel.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 16)
        checkEmailLabel.text = "check your email"
        
        self.view.addSubview(checkEmailLabel)
        
        checkEmailLabel.pin(to: self.view, [.left:
                                        grid.pin, .bottom: 525])
    }
    
    private func makeCodeTextField() -> UITextField {
        let codeInput = UITextField()
        codeInput.setBorder(width: 1, color: UIColor(named: "hintColor") ?? .gray)
        
        codeInput.textColor = .black
        codeInput.font = UIFont(name: "Raleway-Medium", size: 16)
        codeInput.placeholder = "1"
        
        return codeInput
    }
    
    private func setupInput() {
//        let firstCell = UITextField()
//        firstCell.setBorder(width: 1, color: UIColor(named: "hintColor") ?? .gray)
//        firstCell.textColor = .black
//        firstCell.font = UIFont(name: "FONTSPRINGDEMO-PontiacBoldRegular", size: 20)
//        firstCell.placeholder = "1"
//
//
//
//        let grid = Grid(view: self.view)
//
//        firstCell.pin(to: self.view, [.left:
//                                        grid.pin, .bottom: 444])
//
//        self.view.addSubview(firstCell)
    }
}


