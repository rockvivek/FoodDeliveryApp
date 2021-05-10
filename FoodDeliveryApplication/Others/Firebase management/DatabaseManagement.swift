//
//  DatabaseManagement.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 30/04/21.
//

import Foundation
import FirebaseDatabase

class DatabaseManagement {
    
    static let shared = DatabaseManagement()
    
    //feed food data to the database manually
    func feedFoodDataToDatabase(){
        let food1: [String: String] =  [
            "name": "Tomato mix",
            "price": "Rs300",
            "category": "Food",
            "favourite": "false",
            "description": "Very delicious, tasty and one of the finest recipie.",
            "offer": "none"
        ]
        
        let food2: [String: String] =  [
            "name": "Fully Loaded Cheese Burger",
            "price": "Rs180",
            "category": "Fast food",
            "favourite": "false",
            "description": "Tasty and one of the finest recipie loaded with cheese.",
            "offer": "none"
        ]
        let food3: [String: String] =  [
            "name": "Badam shake",
            "price": "Rs100",
            "category": "Shakes",
            "favourite": "false",
            "description": "yummy and healthy shake.",
            "offer": "none"
        ]
        let food4: [String: String] =  [
            "name": "Egg Roll",
            "price": "Rs30",
            "category": "Non-veg",
            "favourite": "false",
            "description": "very delicious, tasty and one of the finest recipie.",
            "offer": "none"
        ]
        
        let food5: [String: String] =  [
            "name": "Chicken Roll",
            "price": "Rs90",
            "category": "Non-veg",
            "favourite": "false",
            "description": "fine and made by cheese and extra topins",
            "offer": "none"
        ]
        
        let food6: [String: String] =  [
            "name": "Kabab roll",
            "price": "Rs50",
            "category": "Non-veg",
            "favourite": "false",
            "description": "Tasty and one of the finest recipie loaded with cheese.",
            "offer": "none"
        ]
        let food7: [String: String] =  [
            "name": "Boneless butter chicken",
            "price": "Rs340",
            "category": "Non-veg",
            "favourite": "false",
            "description": "Too delicious food.",
            "offer": "none"
        ]
        let food8: [String: String] =  [
            "name": "Kadhai paneer",
            "price": "Rs230",
            "category": "Veg",
            "favourite": "false",
            "description": "very delicious, tasty and one of the finest recipie.",
            "offer": "none"
        ]
        let food9: [String: String] =  [
            "name": "Tomato mix",
            "price": "Rs300",
            "category": "Food",
            "favourite": "false",
            "description": "Very delicious, tasty and one of the finest recipie.",
            "offer": "none"
        ]
        
        let food10: [String: String] =  [
            "name": "Fully Loaded Cheese Burger",
            "price": "Rs180",
            "category": "Fast food",
            "favourite": "false",
            "description": "Tasty and one of the finest recipie loaded with cheese.",
            "offer": "none"
        ]
        let food11: [String: String] =  [
            "name": "Badam shake",
            "price": "Rs100",
            "category": "Shakes",
            "favourite": "false",
            "description": "yummy and healthy shake.",
            "offer": "none"
        ]
        let food12: [String: String] =  [
            "name": "Egg Roll",
            "price": "Rs30",
            "category": "Non-veg",
            "favourite": "false",
            "description": "very delicious, tasty and one of the finest recipie.",
            "offer": "none"
        ]
        
        let food13: [String: String] =  [
            "name": "Chicken Roll",
            "price": "Rs90",
            "category": "Non-veg",
            "favourite": "false",
            "description": "fine and made by cheese and extra topins",
            "offer": "none"
        ]
        
        let food14: [String: String] =  [
            "name": "Kabab roll",
            "price": "Rs50",
            "category": "Non-veg",
            "favourite": "false",
            "description": "Tasty and one of the finest recipie loaded with cheese.",
            "offer": "none"
        ]
        let food15: [String: String] =  [
            "name": "Boneless butter chicken",
            "price": "Rs340",
            "category": "Non-veg",
            "favourite": "false",
            "description": "Too delicious food.",
            "offer": "none"
        ]
        let food16: [String: String] =  [
            "name": "Kadhai paneer",
            "price": "Rs230",
            "category": "Veg",
            "favourite": "false",
            "description": "very delicious, tasty and one of the finest recipie.",
            "offer": "none"
        ]
        let food = [
            food1,food2,food3,food4,food5,food6,food7,food8,
            food9,food10,food11,food12,food13,food14,food15,food16
        ]
        let ref = Database.database().reference(withPath: "foods").setValue(food)
        
    }
    
    func getAllFoodData() {
        let ref = Database.database().reference(withPath: "foods")

        // Listen for new comments in the Firebase database
        ref.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! [String: Any]
            let name = snapshotValue["name"] as! String
            let price = snapshotValue["price"] as! String
            let category = snapshotValue["category"] as? String ?? "default value"
            let favourite = snapshotValue["favourite"] as? String ?? "default value"
            let description = snapshotValue["description"] as? String ?? "default value"

            let offer = snapshotValue["offer"] as? String ?? "default value"
            let image = "food"
            var foodItem = Food(name: name, price: price, category: category, favourite: favourite, description: description, offer: offer)
            foods.append(foodItem)
        })
    }
        
    func getAllFoodData(cat:String) {
        foods = []
        let ref = Database.database().reference(withPath: "foods")
        // Listen for new comments in the Firebase database
        ref.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! [String: Any]
            let categoryData = snapshotValue["category"] as? String
            if cat == categoryData{
                let name = snapshotValue["name"] as! String
                let price = snapshotValue["price"] as! String
                let favourite = snapshotValue["favourite"] as? String ?? "default value"
                let description = snapshotValue["description"] as? String ?? "default value"
                
                let offer = snapshotValue["offer"] as? String ?? "default value"
                let image = "food"
                var foodItem = Food(name: name, price: price, category: categoryData!, favourite: favourite, description: description, offer: offer)
                foods.append(foodItem)
            }
        })
    }
    
    func getCartCount()->Int{
        var count = 0
        let ref = Database.database().reference(withPath: "cart")
        ref.observe(.value, with: { snapshot in
            //print(snapshot)
            for _ in snapshot.children {
                count = count + 1
                print(count)
            }
            
        })
        return count
    }
    
    func feedcategoryData() {
        let category:[String] = ["Food", "Veg", "Non-veg", "Shakes", "Fast Food", "Food", "Drinks", "Sauces", "Cakes", "Sweets"]
        let ref = Database.database().reference()
        ref.child("category").setValue(category)
    }

    
    func getCategoryData() {
        let ref = Database.database().reference(withPath: "category")
        //print(ref)
        ref.observe(.childAdded, with: { snapshot in
            let snapshotValue = snapshot.value
            let categoryName = snapshotValue as? String ?? "category"
            category.append(categoryName)
        })
    }
    
    func getCartData() {
        let ref = Database.database().reference(withPath: "cart")
        ref.observe(.childAdded, with: { snapshot in
        let snapshotValue = snapshot.value as! [String: Any]
        let name = snapshotValue["name"] as! String
        let image = snapshotValue["image"] as! String
        let price = snapshotValue["price"] as! String
        let quantity = snapshotValue["quantity"] as! String
                
        let cartData = Cart(name: name, price: price, quantity: quantity, image: image)
         carts.append(cartData)
        })
    }
    
    func changeFavouriteStatus(){
        let ref = Database.database().reference(withPath: "food")
        ref.observeSingleEvent(of: .childAdded, with: { snapshot in
            let snapshotValue = snapshot.value as! [String: Any]
            let favourite = snapshotValue["favourite"] as! String
            print(favourite)
        })
    }
}

