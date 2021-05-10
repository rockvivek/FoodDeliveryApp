//
//  LoginSignupViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 25/04/21.
//

import UIKit

class LoginSignupViewController: UIViewController {

    //MARK:- outlet
    @IBOutlet weak var upperBackgroundView: UIView!
    @IBOutlet weak var loginButonOutlet: UIButton!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signupContainer: UIView!
    
    let loginVC = UserLoginViewController()
    let signupVC = UserSignupViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        upperBackgroundView.layer.cornerRadius = 30.0
        upperBackgroundView.backgroundColor = .systemBackground
        UpperBackgroundBorderShadow()
        
        //make login signup button bottom border
        loginButonOutlet.makeBottomBorder(UIColor.red)
        signupButtonOutlet.makeBottomBorder(UIColor.white)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        loginButonOutlet.makeBottomBorder(UIColor.red)
        signupButtonOutlet.makeBottomBorder(UIColor.white)
        self.loginContainer.alpha = 0.0
        self.signupContainer.alpha = 1.0
        
    }
    @IBAction func signupButtonAction(_ sender: UIButton) {
        
        loginButonOutlet.makeBottomBorder(UIColor.white)
        signupButtonOutlet.makeBottomBorder(UIColor.red)
        self.loginContainer.alpha = 1.0
        self.signupContainer.alpha = 0.0
        
    }
    private func UpperBackgroundBorderShadow() {
        upperBackgroundView.layer.masksToBounds = false
        upperBackgroundView.layer.shadowColor = UIColor.black.cgColor
        upperBackgroundView.layer.shadowOpacity = 0.5
        upperBackgroundView.layer.shadowOffset = CGSize.zero
        upperBackgroundView.layer.shadowRadius = 4
        self.view.addSubview(upperBackgroundView)
    }
    
}


