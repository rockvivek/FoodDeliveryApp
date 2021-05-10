//
//  CartItemTableViewCell.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    
    func configure() {
        
        if counterLabel.text == "1" {
            minusButtonOutlet.setImage( UIImage.init(named: "deleteIcon"), for: .normal)
        }
    }
    
   
    
    @IBAction func minusButtonAction(_ sender: UIButton) {
        
        let count:Int = Int(counterLabel.text!)!
        if count == 2{
            minusButtonOutlet.setImage( UIImage.init(named: "deleteIcon"), for: .normal)
        }
        else if count == 1 {
            print("delete cell")
        }
            counterLabel.text = "\(count - 1)"
        
    }
    
    @IBAction func plusButtonAction(_ sender: UIButton) {
        let count:Int = Int(counterLabel.text!)!
        if count == 1 {
            minusButtonOutlet.setImage( UIImage.init(named: "minusIcon"), for: .normal)
        }
            counterLabel.text = "\(count + 1)"
        
    }
    
    
}
