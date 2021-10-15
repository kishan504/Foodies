//
//  FoodItemDetailViewController.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import UIKit
protocol FoodItemDetailViewControllerProtocol: class {
    func updateFoodItems()
}
class FoodItemDetailViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var stateButton: UIButton!
    weak var delegate: FoodItemDetailViewControllerProtocol?
    var selectedFoodItem: FoodItem!
    // MARK: View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: Setup UI
    private func setupUI() {
        setupNavigationController()
        setupItemName(selectedFoodItem.itemName)
        setupItemImage(selectedFoodItem.itemImageName)
        setupItemDescription(selectedFoodItem.itemDescription)
        setupStateButton()
    }
    private func setupNavigationController() {
        navigationController?.navigationItem.title = "Food Item Detail"
        let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: onClickDone, action: nil)
        navigationController?.navigationItem.rightBarButtonItem = rightButton
    }
    private func setupItemName(_ text: String) {
        itemName.textColor = UIColor.black
        itemName.text = text
    }
    private func setupItemImage(_ name: String) {
        itemImage.contentMode = .scaleAspectFill
        itemImage.image = UIImage(named: name)
    }
    private func setupItemDescription(_ text: String) {
        itemDescription.textColor = UIColor.black
        itemDescription.numberOfLines = 0
        itemDescription.text = text
    }
    private func setupStateButton() {
        stateButton.setTitle(selectedFoodItem.isBlured ? "UnSelected" : "Selected", for: .normal)
        stateButton.titleLabel?.textColor = UIColor.black
        stateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        stateButton.layer.cornerRadius = 10.0
        stateButton.backgroundColor = UIColor.systemTeal
    }
    // MARK: Selector
    @objc func onClickDone() {
        navigationController?.dismiss(animated: true)
    }
    // MARK: Action
    @IBAction func onClickStateButton(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: {
            self.delegate?.updateFoodItems()
        })
    }
}
