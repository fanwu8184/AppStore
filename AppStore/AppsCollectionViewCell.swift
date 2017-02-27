//
//  AppsCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/20/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class AppsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appCategoryLabel: UILabel!
    @IBOutlet weak var appPriceLabel: UILabel!
    var app: App? {
        didSet {
            if let imageName = app?.imageName { appImageView.image = UIImage(named: imageName) }
            appNameLabel.text = app?.name
            appCategoryLabel.text = app?.category
            if let price = app?.price { appPriceLabel.text = "$\(price)" } else { appPriceLabel.text = "" }
        }
    }
}
