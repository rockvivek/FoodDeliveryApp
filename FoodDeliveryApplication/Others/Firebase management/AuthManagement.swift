//
//  AuthManagement.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 26/04/21.
//

import FirebaseAuth

class AuthManagement {
    
    static let shared = AuthManagement()
    
    public func register(_ email:String, _ pass:String) -> Bool {
        var isSignup = false
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print(error!.localizedDescription)
                print("error occured")
                return
            }
            isSignup = true
            print("\(user.email!) created")
        }
        return isSignup
    }
    
    public func login(_ email:String, _ pass:String) -> Bool{
        var isLogin = false
        Auth.auth().signIn(withEmail: email, password: pass, completion: { result, error in
            guard let user = result?.user, error == nil else {
                print(error!.localizedDescription)
                return
            }
            isLogin = true
            print("\(user.email!) user")
        })
        return isLogin
        
    }
}

