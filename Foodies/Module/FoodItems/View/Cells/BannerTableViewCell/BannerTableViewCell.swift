//
//  BannerTableViewCell.swift
//  Foodies
//
//  Created by Divum on 15/10/21.
//
import UIKit
class BannerTableViewCell: UITableViewCell {
    static let identifier = String(describing: BannerTableViewCell.self)
    let images = ["Achari Do Pyaza", "Triple Cheese American Veg Burger", "beverages", "snacks"]
    var timer = Timer()
    var counter = 0
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        registerCollectionViewCell()
        setupCollectionView()
        setupTimer()
    }
    private func setupTimer() {
        DispatchQueue.main.async { [self] in
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        }
    }
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        collectionView.reloadData()
    }
    private func registerCollectionViewCell() {
        collectionView.register(UINib(nibName: BannerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
    }
    @objc func changeImage() {
        if counter < images.count {
            let index = IndexPath.init(item: counter, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        }
    }
}
