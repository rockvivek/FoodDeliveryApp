//
//  LoaderViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 25/04/21.
//

import UIKit

class LoaderViewController: UIViewController {

    @IBOutlet weak var loaderView: UIView!
    
    var loadTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let spinner:SpinnerView = SpinnerView(frame: CGRect(x:20, y: 20, width: 50, height:50))
        self.loaderView.addSubview(spinner)
        
        loadTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timeaction), userInfo: nil, repeats: true)
        
        print("loader page")
        
         }

         //Timer action
    @objc func timeaction(){
            
        //database function calling
        
        //insert food data
        DatabaseManagement.shared.feedFoodDataToDatabase()
        
        //insert food data
        DatabaseManagement.shared.feedcategoryData()
        
        //fetch food data
        //DatabaseManagement.shared.getAllFoodData()
        
        //fetch category data
        DatabaseManagement.shared.getCategoryData()
        
        DatabaseManagement.shared.getAllFoodData()
 
        DatabaseManagement.shared.getCartData()
            
             //code for move next VC
        
             let secondVC = storyboard?.instantiateViewController(withIdentifier: "LoginSignupViewController") as! LoginSignupViewController
                     self.navigationController?.pushViewController(secondVC, animated: true)
             loadTimer
                .invalidate()//after that timer invalid

         }
}
