//
//  textFieldExt.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 26/04/21.
//

import UIKit

extension UITextField {
    func makeBottomBorder(){
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
