//
//  FoodItemsViewController+FoodItemDetailViewControllerProtocol.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import Foundation
extension FoodItemsViewController: FoodItemDetailViewControllerProtocol {
    // MARK: Updating the blur view state
    func updateFoodItems() {
            foodList[selectedSection].foodItemList[selectedIndex].isBlured = !foodList[selectedSection].foodItemList[selectedIndex].isBlured
        tableView.reloadData()
    }
}
