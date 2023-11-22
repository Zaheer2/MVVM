//
//  HomeTableViewCellExtension.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 22/11/2023.
//

import Foundation
import UIKit

extension UIView {
    func setViewRound(_ radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
    }
    
    func setViewBorderAndColor() {
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.borderWidth = 1
    }
}
