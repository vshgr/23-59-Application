//
//  CALayer.swift
//  agvyshegorodtsevaPW2-1
//
//  Created by Алиса Вышегородцева on 23.09.2022.
//

import UIKit

extension CALayer {
    func applyShadow(scale: Bool = true, color: UIColor = UIColor.dl.mainCol() ?? .black) {
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOpacity = 1
        self.shadowOffset = CGSize(width: 10, height: 10)
        self.shadowRadius = 3
        
        self.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.shouldRasterize = true
        self.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
