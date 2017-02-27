//
//  LargeCategoryCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class LargeCategoryCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var largeAppsCollectionView: UICollectionView!
    @IBOutlet weak var largeCategoryNameLabel: UILabel!
    
    var category: Category? {
        didSet {
            largeCategoryNameLabel.text = category?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        largeAppsCollectionView.delegate = self
        largeAppsCollectionView.dataSource = self
    }
    
    //-----------------------------------------COLLECTION VIEW---------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.apps.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.largeAppCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let appCell = cell as! LargeAppsCollectionViewCell
        appCell.app = category?.apps[indexPath.row]
        appCell.largeAppImageView.layer.cornerRadius = appCell.largeAppImageView.frame.width / 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: largeAppsCollectionView.frame.height);
    }
}
