//
//  LargeAppsCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class LargeAppsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var largeAppImageView: UIImageView!
    var app: App? {
        didSet {
            if let imageName = app?.imageName { largeAppImageView.image = UIImage(named: imageName) }
        }
    }
}
