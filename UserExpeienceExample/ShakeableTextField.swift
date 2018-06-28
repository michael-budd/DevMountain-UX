//
//  ShakeableTextField.swift
//  UserExpeienceExample
//
//  Created by Michael Budd on 6/27/18.
//  Copyright © 2018 Michael Budd. All rights reserved.
//

import UIKit

class ShakeableTextField: UITextField {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 7, y: self.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 7, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
        
    }
    
}
