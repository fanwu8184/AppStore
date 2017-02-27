//
//  ImageDetailCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class ImageDetailCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var imageDetailCollectionView: UICollectionView!
    var screenshots: [String]? {
        didSet { imageDetailCollectionView.reloadData() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageDetailCollectionView.delegate = self
        imageDetailCollectionView.dataSource = self
    }
    
    //-----------------------------------------COLLECTION VIEW---------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshots?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.imageCellIdentifier, for: indexPath)
        let imageCell = cell as! ImageCollectionViewCell
        imageCell.imageName = screenshots?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: imageDetailCollectionView.frame.height);
    }
}
