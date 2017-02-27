//
//  HeaderCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                headerImageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
                headerImageView.layer.borderWidth = 0.5
                headerImageView.image = UIImage(named: imageName)
            }
        }
    }
}
