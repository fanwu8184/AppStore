//
//  DescriptionCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descTextView: UITextView!
    var desc: String? {
        didSet { descTextView.text = desc }
    }
}
