//
//  FoodItemsViewController.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import UIKit
// MARK: Food Data
enum FoodItemDetail: CaseIterable {
    case pizza, burgers, beverages, snacks
    var title: String {
        switch self {
        case .pizza: return "Pizza"
        case .burgers: return "Burgers"
        case .beverages: return "Beverages"
        case .snacks: return "Snacks"
        }
    }
    var itemDetail:[FoodItem] {
        switch self {
        case .pizza: return [FoodItem(itemName: "Achari Do Pyaza", itemDescription: "Tangy & spicy achari flavours on a super cheesy onion pizza- as desi as it gets!", itemImageName: "Achari Do Pyaza", isBlured: false), FoodItem(itemName: "Cheese n Tomato", itemDescription: "A delectable combination of cheese and juicy tomato", itemImageName: "CheeseTomato", isBlured: false)]
        case .burgers: return [FoodItem(itemName: "Triple Cheese American Veg Burger", itemDescription: "A crunchy Corn patty filled with Cheese, topped with Jalapenos, shredded Lettuce and more cheese, layered between our New Piri-Piri Buns.", itemImageName: "Triple Cheese American Veg Burger", isBlured: false),
            FoodItem(itemName: "Piri Piri Spiced Veg Burger", itemDescription: "An exotic, spicy Veg patty, topped with roasted chipotle sauce, shredded Onions, Jalapenos and a delish salad all layered between freshly toasted Piri Piri Buns", itemImageName: "Piri Piri Spiced Veg Burger", isBlured: false)]
        case .beverages: return [FoodItem(itemName: "Beverages", itemDescription: "A drink is a liquid intended for human consumption. In addition to their basic function of satisfying thirst, drinks play important roles in human culture. Common types of drinks include plain drinking water, milk, juice and soft drinks. Traditionally warm beverages include coffee, tea, and hot chocolate.", itemImageName: "beverages", isBlured: false)]
        case .snacks: return [FoodItem(itemName: "Snacks", itemDescription: "Nothing beats fresh refreshing snacks from your kitchen!! Check out this awesome collection of Indian evening snacks recipes!!!", itemImageName: "snacks", isBlured: false)]
        }
    }
}
class FoodItemsViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    var foodList: [FoodListModel] = []
    var selectedFoodItem: FoodItem!
    var selectedSection = 0
    var selectedIndex = 0
    // MARK: View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: Setup UI
    private func setupUI() {
        parseData()
        setupTableView()
    }
    // MARK: Setup Table View
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCell()
    }
    // MARK: Register Cells
    private func registerTableViewCell() {
        tableView.register(UINib(nibName: BannerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BannerTableViewCell.identifier)
        tableView.register(UINib(nibName: FoodItemHeaderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FoodItemHeaderTableViewCell.identifier)
        tableView.register(UINib(nibName: FoodItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FoodItemTableViewCell.identifier)
    }
    // MARK: Parsing data
    private func parseData() {
        foodList.append(FoodListModel(title: FoodItemDetail.pizza.title, isExpanded: false, foodItemList: FoodItemDetail.pizza.itemDetail))
        FoodItemDetail.allCases.forEach { foodList.append(FoodListModel(title: $0.title,isExpanded: false, foodItemList: $0.itemDetail))}
    }
    // MARK: Passing Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController, let foodItemDetailViewController: FoodItemDetailViewController = navigationController.topViewController as? FoodItemDetailViewController {
            foodItemDetailViewController.selectedFoodItem = selectedFoodItem
            foodItemDetailViewController.delegate = self
        }
    }
}
