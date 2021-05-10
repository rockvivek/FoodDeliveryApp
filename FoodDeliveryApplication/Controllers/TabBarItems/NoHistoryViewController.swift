//
//  NoHistoryViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit

class NoHistoryViewController: UIViewController {

    @IBOutlet weak var OrderButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        OrderButtonOutlet.layer.cornerRadius = 30.0
    }

    @IBAction func orderButtonAction(_ sender: UIButton) {
    }
}
