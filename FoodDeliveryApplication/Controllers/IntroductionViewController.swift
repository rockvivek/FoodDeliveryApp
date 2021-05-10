//
//  ViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 24/04/21.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    struct  Constants {
        let cornerRadius:CGFloat = 30.0
    }
    
    //MARK:- outlets
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var logoBackgroundView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    //MARK:- viewcontroller delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //background color set
        self.view.backgroundColor = UIColor(rgb: 0xFF4B3A)
        
        logoBackgroundView.layer.cornerRadius = logoBackgroundView.frame.size.width / 2
        
        addingLogo()
        
        createBlurEffectToPersons()
        
        getStartedButton.layer.cornerRadius = 30.0
         
    }
    @IBAction func getStartedButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "LoaderViewController") as! LoaderViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createBlurEffectToPersons() {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 0.0, y: 1.0)
        layer.colors = [
            UIColor(red: 1, green: 0.278, blue: 0.043, alpha: 0.4).cgColor,
            UIColor(red: 1, green: 0.278, blue: 0.043, alpha: 1).cgColor
          ]
        layer.frame = CGRect(x: 0, y: 0, width: blurView.frame.size.width, height: blurView.frame.size.height)
        blurView.layer.addSublayer(layer)
    }
    
    //adding logo to the main view
    private func addingLogo() {
        logoImage.frame = CGRect(x: 15, y:10, width: 40.22, height: 49.65)
        logoBackgroundView.addSubview(logoImage)
        
    }
}
