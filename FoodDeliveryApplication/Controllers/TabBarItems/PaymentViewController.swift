//
//  PaymentViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 07/05/21.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var deliveryMethodBackground: UIView!
    @IBOutlet weak var paymentMethodBackgroundView: UIView!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var paymentButtonOutlet: UIButton!
    
    @IBOutlet weak var paymentRBOutlet1: UIButton!
    @IBOutlet weak var paymentRBOutlet2: UIButton!
    @IBOutlet weak var deliveryRBOutlet1: UIButton!
    @IBOutlet weak var deliveryRBOutlet2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentMethodBackgroundView.layer.cornerRadius = 20
        deliveryMethodBackground.layer.cornerRadius = 20
        paymentButtonOutlet.layer.cornerRadius = 30
    }

    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func proceedToPayment(_ sender: UIButton) {
    }
    
    @IBAction func paymentRadioButton1(_ sender: UIButton) {
        paymentRBOutlet1.setImage(UIImage(named: "radio-on"), for: .normal)
        paymentRBOutlet2.setImage(UIImage(named: "radio-off"), for: .normal)
        
        let vc = storyboard?.instantiateViewController(identifier: "CArdDetailsViewController") as! CArdDetailsViewController
        vc.name = "card"
        navigationController?.present(vc, animated: true,completion: nil)
        
    }
    @IBAction func paymentRadioButton2(_ sender: UIButton) {
        paymentRBOutlet2.setImage(UIImage(named: "radio-on"), for: .normal)
        paymentRBOutlet1.setImage(UIImage(named: "radio-off"), for: .normal)
        let vc = storyboard?.instantiateViewController(identifier: "CArdDetailsViewController") as! CArdDetailsViewController
        vc.name = "bank"
        navigationController?.present(vc, animated: true,completion: nil)
    }
    
    
    @IBAction func deliveryRadioButton1(_ sender: UIButton) {
        deliveryRBOutlet1.setImage(UIImage(named: "radio-on"), for: .normal)
        deliveryRBOutlet2.setImage(UIImage(named: "radio-off"), for: .normal)
    }
    @IBAction func deliveryRAdioButton2(_ sender: UIButton) {
        deliveryRBOutlet2.setImage(UIImage(named: "radio-on"), for: .normal)
        deliveryRBOutlet1.setImage(UIImage(named: "radio-off"), for: .normal)
    }
    
}
