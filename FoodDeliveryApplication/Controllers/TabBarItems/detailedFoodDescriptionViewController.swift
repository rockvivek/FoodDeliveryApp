//
//  detailedFoodDescriptionViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class detailedFoodDescriptionViewController: UIViewController {
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var addCartButtonOutlet: UIButton!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    var foodName:String?
    var foodPrice:String?
    var foodImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCartButtonOutlet.layer.cornerRadius = 30.0
        foodNameLabel.text = foodName
        foodPriceLabel.text = foodPrice
        //foodImageView.image = UIImage(named: "\(foodImage)")
        
        
    }

    @IBAction func addCartAction(_ sender: UIButton) {
        if Auth.auth().currentUser != nil{
            let ref = Database.database().reference(withPath:"cart")
            
            let item = ref.child("cart\(Int.random(in: 0..<1000000))")
    
//
            guard let name = foodName,let price = foodPrice, let image = foodImage else { return }
            let foodDict: Dictionary<String, String> = [
               "name": "\(name)",
                "price": "\(price)",
                "quantity": "1",
                "image": "\(image)"
            ]

            //saving value
            item.setValue(foodDict) { (error:Error?, ref:DatabaseReference) in
                if let error = error {
                  print("Data could not be saved: \(error).")
                } else {
                  print("Data saved successfully!")
                }
            }
       
        }
        
        func checkIfItemAlreadyInCart(){
            //get value from database
            let ref = Database.database().reference().child("users").child("user").child("username")
            ref.observeSingleEvent(of: .childAdded, with: { (snapshot) in
                 if let userDict = snapshot.value as? [String:Any] {
                      //Do not cast print it directly may be score is Int not string
                      print(userDict["score"])
                 }
            })
        }
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        DatabaseManagement.shared.changeFavouriteStatus()
    }
}
