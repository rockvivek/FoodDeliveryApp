//
//  CartViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var completeOrderOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        cartTableView.register(UINib(nibName: "CartItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CartItemTableViewCell")
        //self.layoutMargins = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        
        completeOrderOutlet.layer.cornerRadius = 30.0
        
        cartTableView.separatorStyle = .none
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func completeOrderAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "DeliveryViewController") as! DeliveryViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell
        cell.counterLabel.text = carts[indexPath.section].quantity
        cell.foodNameLabel.text = carts[indexPath.section].name
        cell.foodPriceLabel.text =  carts[indexPath.section].price
        cell.foodImage.image = UIImage(named:  "\(carts[indexPath.section].image)")
        cell.configure()
        
        cell.backgroundColor = .systemGray6
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // delete cell
        let TrashAction = UIContextualAction(style: .normal, title:  "Trash", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            success(true)
        })
        
        TrashAction.backgroundColor = .systemRed
        TrashAction.image = UIImage(named: "deleteIcon")

        // Write action code for the Flag
        let FlagAction = UIContextualAction(style: .normal, title:  "Fav", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        FlagAction.backgroundColor = .orange
        FlagAction.image = UIImage(named:"heartIcon")

        return UISwipeActionsConfiguration(actions: [TrashAction,FlagAction])
        
    }
    // Set the spacing between sections
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 14
        }
        
        // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
   
    
}
