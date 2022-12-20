//
//  UIColor+Extension.swift
//  mpei-app
//
//  Created by Глеб Фандеев on 20.12.2022.
//

import UIKit

private let veryLightGrey = UIColor(white: 0.9, alpha: 1.0)

extension UIColor {
    struct ProfessorsTableCell {
        static let background = veryLightGrey
        
        static let border = UIColor.darkGray
    }
    
    struct TabBar {
        static let background = UIColor.systemGray
    }
}
