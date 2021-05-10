//
//  HistoryViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if history.count == 0 {
            let vc = storyboard?.instantiateViewController(identifier: "NoHistoryViewController") as! NoHistoryViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
