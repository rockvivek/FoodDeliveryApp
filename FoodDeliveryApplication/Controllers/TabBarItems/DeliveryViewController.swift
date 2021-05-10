//
//  DeliveryViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 07/05/21.
//

import UIKit

class DeliveryViewController: UIViewController {

    @IBOutlet weak var addressBackgroundView:UIView!
    @IBOutlet weak var deliveryBackgroundView:UIView!
    
    @IBOutlet weak var deliveryRBOutlet1:UIButton!
    @IBOutlet weak var deliveryRBOutlet2:UIButton!
    
    @IBOutlet weak var paymentButtonOutlet:UIButton!
    @IBOutlet weak var totalAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentButtonOutlet.layer.cornerRadius = 30
        deliveryBackgroundView.layer.cornerRadius = 20
        addressBackgroundView.layer.cornerRadius = 20
    }
    
    @IBAction func chnageAddress(_ sender: UIButton) {
    }
    
    @IBAction func deliveryRadioButton1(_ sender: UIButton) {
        deliveryRBOutlet1.setImage(UIImage(named: "radio-on"), for: .normal)
        deliveryRBOutlet2.setImage(UIImage(named: "radio-off"), for: .normal)
    }
    @IBAction func deliveryRAdioButton2(_ sender: UIButton) {
        deliveryRBOutlet2.setImage(UIImage(named: "radio-on"), for: .normal)
        deliveryRBOutlet1.setImage(UIImage(named: "radio-off"), for: .normal)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func paymentAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "PaymentViewController") as! PaymentViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
