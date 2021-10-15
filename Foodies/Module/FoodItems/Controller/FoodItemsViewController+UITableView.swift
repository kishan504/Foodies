//
//  FoodItemsViewController+UITableView.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import Foundation
import UIKit
extension FoodItemsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumberOfRowInSection(section)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil } else {
            let header = tableView.dequeueReusableCell(withIdentifier: FoodItemHeaderTableViewCell.identifier)
            guard let foodItemHeaderTableViewCell = header as? FoodItemHeaderTableViewCell else { return header }
            foodItemHeaderTableViewCell.selectedFoodCallBack = selectedFoodCallBack
            foodItemHeaderTableViewCell.refreshHeaderTitle(foodList[section].title, section)
            return foodItemHeaderTableViewCell
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let header = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier, for: indexPath)
            guard let bannerTableViewCell = header as? BannerTableViewCell else { return header }
            return bannerTableViewCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FoodItemTableViewCell.identifier, for: indexPath)
            guard let tableCell = cell as? FoodItemTableViewCell else { return cell }
             let foodItem = foodList[indexPath.section].foodItemList[indexPath.row]
                tableCell.refreshFoodItemViewCell(foodItem)
            return tableCell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedIndex = indexPath.row
        selectedFoodItem = foodList[indexPath.section].foodItemList[indexPath.row]
        performSegue(withIdentifier: "FoodItemDetailSegue", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodList.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if !(section == 0) {
            return 50
        }
        return 0
    }
    // MARK: Get number of rows in a particular section
    private func getNumberOfRowInSection(_ section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if foodList[section].isExpanded { return 0 }
            return foodList[section].foodItemList.count
        }
    }
    // MARK: Folding/ UnFolding of Item list
    private func selectedFoodCallBack(_ section: Int) {
        let section = section
        var indexPaths = [IndexPath]()
        for row in foodList[section].foodItemList.indices {
            print(0,row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        foodList[section].isExpanded = !foodList[section].isExpanded
        if foodList[section].isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
}
