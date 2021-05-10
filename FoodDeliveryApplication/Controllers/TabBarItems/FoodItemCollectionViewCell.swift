//
//  FoodItemCollectionViewCell.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 27/04/21.
//

import UIKit

class FoodItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var backgroundRectView: UIView!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
}
