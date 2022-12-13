//
//  PhotoPickerPopup.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

class PhotoPicker : UIView {
    // MARK: - Constants
    private enum Constants {
        static let bearImg: UIImage? = UIImage(named: "bear")
        static let rabbitImg: UIImage? = UIImage(named: "rabbit")
        static let catImg: UIImage? = UIImage(named: "cat")
        static let dogImg: UIImage? = UIImage(named: "dog")
        static let stackSpacing: Double = 33
        static let alpha: Double = 0.3
        static let contentSpacing: Double = 23
        static let upDownSpacing: Double = 30
        static let buttonHeight: Double = 46
        static let cornerRadius: Double = 10
        static let errorMessage: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    let selectedPic = UIImage(named: "rabbit")
    let popup = UIView()
    let title = UILabel()
    let saveButton = UIButton()
    let stackFirstLine = UIStackView()
    let stackSecondLine = UIStackView()
    let bearButton = UIButton()
    let catButton = UIButton()
    let dogButton = UIButton()
    let rabbitButton = UIButton()
    
    // MARK: - Init
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.errorMessage)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // MARK: - Setups
    private func setupView(){
        backgroundColor = UIColor.black.withAlphaComponent(Constants.alpha)
        
        setupSubviews()
        setupStacks()
        setupTitle()
        setupButton()
        setupConstraints()
        configureButtons()
    }
    
    private func configureButtons() {
        let cr = (Constants.bearImg?.size.height ?? 94) / 2
        bearButton.setImage(Constants.bearImg, for: .normal)
        catButton.setImage(Constants.catImg, for: .normal)
        dogButton.setImage(Constants.dogImg, for: .normal)
        rabbitButton.setImage(Constants.rabbitImg, for: .normal)
        
        for btn in [bearButton, catButton, dogButton, rabbitButton] {
            btn.layer.cornerRadius = cr
        }
        
        for btn in [bearButton, catButton, dogButton, rabbitButton] {
            btn.addTarget(self, action: #selector(selectPic), for: .touchUpInside)
        }
    }
    
    private func setupSubviews() {
        popup.addSubview(title)
        popup.addSubview(stackFirstLine)
        popup.addSubview(stackSecondLine)
        popup.addSubview(saveButton)
        popup.backgroundColor = .white
        popup.layer.cornerRadius = Constants.cornerRadius
        
        addSubview(popup)
        
        stackFirstLine.addArrangedSubview(bearButton)
        stackFirstLine.addArrangedSubview(rabbitButton)
        stackSecondLine.addArrangedSubview(catButton)
        stackSecondLine.addArrangedSubview(dogButton)
    }
    
    private func setupStacks() {
        for stack in [stackFirstLine, stackSecondLine] {
            stack.axis = .horizontal
            stack.spacing = Constants.stackSpacing
        }
    }
    
    private func setupButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.dl.mainFont()
        saveButton.titleLabel?.textColor = .white
        saveButton.setHeight(Constants.buttonHeight)
        saveButton.layer.cornerRadius = Constants.buttonHeight / 2
        saveButton.backgroundColor = .black
    }
    
    private func setupTitle() {
        title.text = "Profile picture"
        title.textColor = .black
        title.font = UIFont.dl.ralewayBold(20)
    }
    
    private func setupConstraints() {
        for view in [title, stackFirstLine, stackSecondLine, saveButton] {
            view.pinCenterX(to: popup.centerXAnchor)
        }
        popup.pinHorizontal(to: self, Grid.stripe * 2)
        popup.pinCenter(to: self)
        title.pinTop(to: popup.topAnchor, Constants.upDownSpacing)
        stackFirstLine.pinTop(to: title.bottomAnchor, Constants.contentSpacing)
        stackSecondLine.pinTop(to: stackFirstLine.bottomAnchor, Constants.contentSpacing)
        saveButton.pinTop(to: stackSecondLine.bottomAnchor, Constants.contentSpacing)
        saveButton.pinHorizontal(to: popup, Constants.contentSpacing * 3)
        saveButton.pinBottom(to: popup.bottomAnchor, Constants.upDownSpacing)
    }
    
    private func resetAllBoarders() {
        for btn in [bearButton, catButton, dogButton, rabbitButton] {
            btn.setBorder(width: 0, color: .white)
        }
    }
    
    @objc
    private func selectPic(_ sender: UIButton) {
        resetAllBoarders()
        sender.setBorder(width: 3, color: UIColor.dl.violetCol() ?? .systemRed)
    }
    
}

class PhotoPickerController: UIViewController {
    // MARK: - Fields
    private let photoPicker = PhotoPicker()
    
    // MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
        view = photoPicker
        photoPicker.saveButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
