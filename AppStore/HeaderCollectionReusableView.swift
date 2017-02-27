//
//  HeaderCollectionReusableView.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    var header: Category? {
        didSet { headerCollectionView.reloadData() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
    }
    
    //-----------------------------------------COLLECTION VIEW---------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return header?.apps.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.headerCellIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let appCell = cell as! HeaderCollectionViewCell
        appCell.app = header?.apps[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: headerCollectionView.frame.height)
    }
}
