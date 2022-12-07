//
//  PhotoPickerPopup.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

class PhotoPicker : UIView{
    let height: CGFloat
    let width: CGFloat
    
    let view = UIView()
    let title = UILabel()
    
    let bear = UIImageView(image: UIImage(named: "bear"))
    let rabbit = UIImageView(image: UIImage(named: "rabbit"))
    let cat = UIImageView(image: UIImage(named: "cat"))
    let dog = UIImageView(image: UIImage(named: "dog"))
    
    init(frame: CGRect = .zero, height: CGFloat, width: CGFloat) {
        self.height = height
        self.width = width
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(view)
        addSubview(title)
        addSubview(bear)
        addSubview(rabbit)
        addSubview(cat)
        addSubview(dog)

        view.setHeight(height)
        view.setWidth(width)
        
        title.text = "Profile picture"
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
}
