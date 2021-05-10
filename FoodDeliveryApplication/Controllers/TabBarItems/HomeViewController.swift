//
//  HomeViewController.swift
//  FoodDeliveryApplication
//
//  Created by vivek shrivastwa on 26/04/21.
//

import UIKit
import FirebaseDatabase

class HomeViewController: UIViewController{
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var foodItemCollectionView: UICollectionView!
    @IBOutlet weak var cartValueCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.categoryCollectionView.collectionViewLayout = layout
        
        categoryCollectionView.showsHorizontalScrollIndicator = false
        
        
        foodItemCollectionView.delegate = self
        foodItemCollectionView.dataSource = self
        
        self.foodItemCollectionView.register(UINib(nibName: "FoodItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodItemCollectionViewCell")
        
        let foodItemLayout = UICollectionViewFlowLayout()
        foodItemLayout.scrollDirection = .horizontal
        self.foodItemCollectionView.collectionViewLayout = foodItemLayout
        
        self.foodItemCollectionView.showsHorizontalScrollIndicator = false
        
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
            self.foodItemCollectionView.reloadData()
            self.cartValueCount.text = "\(carts.count)"
        }

    }
    
    @IBAction func cartButtonAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView{
            return category.count
        }
        else {
            return foods.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! FoodCategoryCollectionViewCell
            cell.foodLabel.text = category[indexPath.row]
            cell.decorateLabel()
            if indexPath.row == 0 {
                cell.bottomBorderLabel.isHidden = false
                cell.foodLabel.textColor = .systemRed
            }
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as! FoodItemCollectionViewCell
            cell.foodNameLabel.text = foods[indexPath.row].name
            cell.foodPriceLabel.text = foods[indexPath.row].price
            cell.foodImageView.image = UIImage(named: "\(foods[indexPath.row].image)")
            cell.backgroundRectView.layer.cornerRadius = 30.0
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            //fetch category data
//            let data = category[indexPath.row]
//            DatabaseManagement.shared.getAllFoodData(cat:data)
//            DispatchQueue.main.async {
//                self.foodItemCollectionView.reloadData()
//            }
        }
        else{
            let foodDetailVC = storyboard?.instantiateViewController(identifier: "detailedFoodDescriptionViewController") as! detailedFoodDescriptionViewController
            
            foodDetailVC.foodName = foods[indexPath.row].name
            foodDetailVC.foodPrice = foods[indexPath.row].price
            foodDetailVC.foodImage = foods[indexPath.row].image
            
            self.navigationController?.pushViewController(foodDetailVC, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: 100, height: 50)
        }
        else{
            return CGSize(width: 220, height: 307)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoryCollectionView {
            return 5
        }
        else{
            return 30
        }
        
    }
    
}

