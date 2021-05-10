//
//  ProfileViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 28/04/21.
//

import UIKit

class ProfileViewController: UIViewController {

    var tableData = ["Order", "Favourite", "Address" , "FAQ", "Help"]
    
    @IBOutlet weak var ProfileTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileTabelView.delegate = self
        ProfileTabelView.dataSource = self
        ProfileTabelView.separatorStyle = .none
        ProfileTabelView.backgroundColor = UIColor.clear
    }
    
    @IBAction func changePersonalDetails(_ sender: UIButton) {
        
    }
    
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        cell.textLabel!.text = tableData[indexPath.section]
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // Set the spacing between sections
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 15
        }
        
        // Make the background color show through
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
}
