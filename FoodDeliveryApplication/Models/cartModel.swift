//
//  cartModel.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 30/04/21.
//

import Foundation
import FirebaseDatabase

struct Cart {
    var name: String
    var price: String
    var image: String
    var quantity: String
    
    
    init(name:String, price: String, quantity:String, image: String = "food") {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.image = image
    }
    
    
}

var carts:[Cart] = []
