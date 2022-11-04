//
//  Extension.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import UIKit

extension UIView {
    
    func setviewCornerRadius() {
        self.clipsToBounds  =  true
        self.layer.cornerRadius = self.frame.height/2
    }
    
    func setCornerRadius(value: CGFloat) {
        self.clipsToBounds  =  true
        self.layer.cornerRadius = value
    }
    
    func setfullRadiusWithShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.7
        self.layer.masksToBounds = false
    }
    
}

extension UIButton {
    
    func setBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
    
}
