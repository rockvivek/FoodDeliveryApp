//
//  foodModel.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 29/04/21.
//

import Foundation
import FirebaseDatabase

//struct Food: Codable {
//    let name, price, category, favourite: String
//    let welcomeDescription, offer: String
//
//    enum CodingKeys: String, CodingKey {
//        case name, price, category, favourite
//        case welcomeDescription = "description"
//        case offer
//    }
//}

struct Food {
    var name: String
    var price: String
    var category: String
    var image: String
    var description: String
    var favourite: String
    var offer: String
    
    
    init(name:String, price: String, category:String, image: String = "food", favourite: String
         , description: String, offer: String) {
        self.name = name
        self.price = price
        self.category = category
        self.image = image
        self.favourite = favourite
        self.offer = offer
        self.description = description
    }
}

var foods = [Food]()
