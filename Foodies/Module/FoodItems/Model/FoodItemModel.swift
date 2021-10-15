//
//  FoodItemModel.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import Foundation
struct FoodListModel {
    var title: String
    var isExpanded: Bool
    var foodItemList: [FoodItem]
}
struct FoodItem {
    var itemName: String
    var itemDescription: String
    var itemImageName: String
    var isBlured: Bool
}
