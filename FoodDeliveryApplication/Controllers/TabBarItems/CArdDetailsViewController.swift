//
//  CArdDetailsViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 09/05/21.
//

import UIKit

class CArdDetailsViewController: UIViewController {

    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
        makeBankDetailUI()
    }
    
    func makeBankDetailUI(){
        if name == "card"{
            print("card")
            view.backgroundColor = .red
        }
        else {
            print("bank")
            view.backgroundColor = .blue
        }
    }
}
