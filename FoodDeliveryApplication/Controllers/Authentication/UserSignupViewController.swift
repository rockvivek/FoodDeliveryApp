//
//  UserSignupViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 25/04/21.
//

import UIKit
import FirebaseAuth

class UserSignupViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confPasswordTF: UITextField!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        emailTF.makeBottomBorder()
        passwordTF.makeBottomBorder()
        confPasswordTF.makeBottomBorder()
        
        signupButtonOutlet.layer.cornerRadius = 30.0
        
        //TextField Delegate
        emailTF.delegate = self
        passwordTF.delegate = self
        confPasswordTF.delegate = self
        
    }

    @IBAction func signupButtonAction(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print(error!.localizedDescription)
                if error?.localizedDescription == "The email address is already in use by another account." {
                    let alert = UIAlertController(title: "Signup", message: "The email address is already in use by another account. Go to login or create account with another email id.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                print("error occured")
                return
            }
            let alert = UIAlertController(title: "Signup", message: "User account created successfully.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Go to login", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("\(user.email!) created")
            }
        }

    
    

    private func validate(_ textField:UITextField){
        if textField == emailTF {
            guard let email = textField.text else {
                return
            }
            if !validateEmail(email){
                message = "Email Id is invalid. Please Enter a valid EmailId."
            }
        }
        else if textField == passwordTF {
            guard let password = textField.text else {
                return
            }
            if !validatePassword(password){
                message = "Invalid Password. Passwprd must contaions minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:"
            }
        }
        else if textField == confPasswordTF {
            guard let confPass = textField.text,
                  let password = passwordTF.text else {
                return
            }
            if !matchPassword(pass: password, confPass: confPass) {
               message = "Password did not match. Please enter same password."
           }
        }
        
        if message != "" {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            message = ""
        }
        
        
    }
    private func validateEmail(_ email:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return  NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    private func matchPassword(pass:String, confPass:String) -> Bool {
        return pass == confPass
    }
    
    private func validatePassword(_ password:String) -> Bool{
        //password contains at least one alphabed, one number, and one special character
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        return  NSPredicate(format:"SELF MATCHES %@", passwordRegEx).evaluate(with: password)
    }
}


extension UserSignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            validate(emailTF)
            passwordTF.becomeFirstResponder()
        }
        else if textField == passwordTF {
            validate(passwordTF)
            confPasswordTF.becomeFirstResponder()
        }
        else if textField == confPasswordTF {
            validate(confPasswordTF)
            //signupButtonAction(singupButtonOutlet)
        }
        return true
    }
    
}

