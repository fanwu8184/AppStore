//
//  ImageCollectionViewCell.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageName: String? {
        didSet { if let name = imageName { imageView.image = UIImage(named: name) } }
    }
}
