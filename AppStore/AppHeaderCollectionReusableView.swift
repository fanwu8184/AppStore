//
//  AppHeaderCollectionReusableView.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class AppHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    var app: App? {
        didSet {
            appImageView.layer.cornerRadius = appImageView.frame.width / 16
            if let imageName = app?.imageName { appImageView.image = UIImage(named: imageName) }
            appNameLabel.text = app?.name
            buyButton.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
            buyButton.layer.borderWidth = 1
            buyButton.layer.cornerRadius = 5
            if let price = app?.price { buyButton.setTitle("$\(price)", for: .normal) } else { buyButton.setTitle("GET", for: .normal) }
        }
    }
    
}
