//
//  UIButtonExt.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 25/04/21.
//

import UIKit

extension UIButton {
    public func makeBottomBorder(_ color: UIColor){
        let lineView = UIView(frame: CGRect(x: 0, y: self.frame.size.height - 3, width: self.frame.size.width, height: 3))
        lineView.backgroundColor = color
        self.addSubview(lineView)
    }
}


