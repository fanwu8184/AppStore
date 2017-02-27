//
//  FeatureAppCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/20/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class FeatureAppCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var appsCollectionView: UICollectionView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    var category: Category? {
        didSet { categoryNameLabel.text = category?.name }
    }
    var delegate: AppSegueDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
    }
    
    //-----------------------------------------COLLECTION VIEW---------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.apps.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.appCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let appCell = cell as! AppsCollectionViewCell
        appCell.app = category?.apps[indexPath.row]
        appCell.appImageView.layer.cornerRadius = appCell.appImageView.frame.width / 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: appsCollectionView.frame.height);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = category?.apps[indexPath.row] { delegate?.showDetails(of: app) }
    }
}
