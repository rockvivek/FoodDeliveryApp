//
//  NoOrderViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit

class NoOrderViewController: UIViewController {

    @IBOutlet weak var orderButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderButtonOutlet.layer.cornerRadius = 30.0
    }
    @IBAction func orderButtonAction(_ sender: Any) {
    }
    
}
