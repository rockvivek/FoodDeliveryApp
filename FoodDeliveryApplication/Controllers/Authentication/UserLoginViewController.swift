//
//  UserLoginViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 25/04/21.
//

import UIKit
import FirebaseAuth

class UserLoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButtonOutlet.layer.cornerRadius = 30.0
        view.backgroundColor = .systemGray6
        emailTF.makeBottomBorder()
        passwordTF.makeBottomBorder()
    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
            guard let user = result?.user, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "TabBarController") as! UITabBarController
            mainTabBarController.modalPresentationStyle = .fullScreen
            
            self.present(mainTabBarController, animated: true, completion: nil)
            print("\(user.email!) user")
        })
        
        
        
    }
    
    @IBAction func forgetpasscodeAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Forget password", message: "Enter Your Emai Id .", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Email Id"
        }
        alert.addAction(UIAlertAction(title: "Get Link", style: .default, handler: { [weak alert] (_) in
            guard let email = alert?.textFields![0] else { return }
            Auth.auth().sendPasswordReset(withEmail: email.text!, completion: {error in
                guard error != nil else {
                    print(error?.localizedDescription)
                    return
                }
                let alert = UIAlertController(title: "Message", message: "A password reset link is sent toyour given email id..", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated:true)
            })
            
        }))
        present(alert, animated: true)
    }
}


