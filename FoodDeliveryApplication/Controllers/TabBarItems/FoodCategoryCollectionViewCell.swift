//
//  FoodCategoryCollectionViewCell.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 27/04/21.
//

import UIKit

class FoodCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomBorderLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    func decorateLabel(){
        foodLabel.textColor = .systemGray
        bottomBorderLabel.isHidden = true
    }
    
}
