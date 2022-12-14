//
//  Code.swift
//  CourseWork3
//
//  Created by Барбашина Яна on 08.12.2022.
//

import UIKit

class Code {
    func checkCodeDigitsFilled(cell: UITextField) -> Bool {
        guard let cellNumber = cell.text else { return false }
        
        if (cellNumber.isEmpty) {
            return false
        } else {
            return true
        }
    }
}
