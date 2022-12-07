//
//  PhotoPickerPopup.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

class PhotoPicker : UIView{
    let view = UIView()
    let title = UILabel()
    
    let bear = UIImageView(image: UIImage(named: "bear"))
    let rabbit = UIImageView(image: UIImage(named: "rabbit"))
    let cat = UIImageView(image: UIImage(named: "cat"))
    let dog = UIImageView(image: UIImage(named: "dog"))
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setupView(){
        view.backgroundColor = .blue
        addSubview(view)
        addSubview(title)
        addSubview(bear)
        addSubview(rabbit)
        addSubview(cat)
        addSubview(dog)
        
        title.text = "Profile picture"
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
