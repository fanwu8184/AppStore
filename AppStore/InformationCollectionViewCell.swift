//
//  InformationCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class InformationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var familySharingLabel: UILabel!
    var app: App? {
        didSet {
            sellerLabel.text = app?.seller
            categoryLabel.text = app?.category
            updatedLabel.text = app?.updated
            versionLabel.text = app?.version
            sizeLabel.text = app?.size
            ratingLabel.text = app?.rating
            familySharingLabel.text = app?.familySharing
        }
    }
}
