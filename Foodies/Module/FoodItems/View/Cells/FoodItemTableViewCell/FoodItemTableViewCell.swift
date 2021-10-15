//
//  FoodItemTableViewCell.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import UIKit
class FoodItemTableViewCell: UITableViewCell {
    static let identifier = String(describing: FoodItemTableViewCell.self)
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func refreshFoodItemViewCell(_ foodItem: FoodItem) {
        setupItemName(foodItem.itemName)
        setupItemDescription(foodItem.itemDescription)
        setupImageView(foodItem.itemImageName)
        setupBlurView(foodItem.isBlured)
    }
    private func setupItemName(_ text: String) {
        itemName.textColor = UIColor.brown
        itemName.text = text
    }
    private func setupImageView(_ name: String) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.layer.cornerRadius = 10.0
        itemImageView.image = UIImage(named: name)
    }
    private func setupItemDescription(_ text: String) {
        itemDescription.font = UIFont(name: "Montserrat", size: 16)
        itemDescription.numberOfLines = 0
        itemDescription.text = text
    }
    private func setupBlurView(_ isBlur: Bool) {
        blurView.isHidden = !isBlur
    }
}
