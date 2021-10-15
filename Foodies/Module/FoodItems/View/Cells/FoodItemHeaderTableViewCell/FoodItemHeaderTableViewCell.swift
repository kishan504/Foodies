//
//  FoodItemHeaderTableViewCell.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import UIKit
class FoodItemHeaderTableViewCell: UITableViewCell {
    static let identifier = String(describing: FoodItemHeaderTableViewCell.self)
    var selectedFoodCallBack: ((_ section: Int) -> Void)?
    @IBOutlet weak var titleButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // MARK: Refresh Header Title
    func refreshHeaderTitle(_ text: String,_ section: Int) {
        titleButton.tag = section
        titleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        titleButton.titleLabel?.textColor = UIColor.black
        titleButton.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0)
        titleButton.contentHorizontalAlignment = .left
        titleButton.setTitle(text, for: .normal)
    }
    @IBAction func titleButtonPressed(_ sender: Any) {
        selectedFoodCallBack?(titleButton.tag)
    }
}
