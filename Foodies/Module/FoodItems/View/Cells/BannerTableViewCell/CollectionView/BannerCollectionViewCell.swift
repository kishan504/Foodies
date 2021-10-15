//
//  BannerCollectionViewCell.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//

import UIKit
class BannerCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: BannerCollectionViewCell.self)
    @IBOutlet weak var bannerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupBannerImageView()
    }
    private func setupBannerImageView() {
        bannerImageView.contentMode = .scaleAspectFill
    }
}
