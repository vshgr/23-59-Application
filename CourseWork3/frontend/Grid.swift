//
//  Grid.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 05.12.2022.
//

import Foundation
import UIKit

class Grid {
    let pin: Double
    let columns: Double = 4
    var columnWeight: Double
    let margin: Double = 20
    
    init(view: UIView) {
        columnWeight = Double(view.frame.size.width - margin * 5) / columns
        pin = columnWeight
    }
}
