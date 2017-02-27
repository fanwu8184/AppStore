//
//  AppDetailsViewController.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class AppDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var appDetailsCollectionView: UICollectionView!
    var app: App?

    override func viewDidLoad() {
        super.viewDidLoad()
        app?.updateValue { self.appDetailsCollectionView.reloadData() }
    }
    
    //-----------------------------------------COLLECTION VIEW---------------------------------------------------------
    //HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MStoryboard.appHeaderCellIdentifier, for: indexPath)
        let headerView = reusableView as! AppHeaderCollectionReusableView
        headerView.app = app
        return reusableView
    }
    
    //CELL
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.informationCellIdentifier, for: indexPath)
            let informationCell = cell as! InformationCollectionViewCell
            informationCell.app = app
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.descriptionCellIdentifier, for: indexPath)
            let descriptionCell = cell as! DescriptionCollectionViewCell
            descriptionCell.desc = app?.description
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.imageDetailCellIdentifier, for: indexPath)
        let imageDetailCell = cell as! ImageDetailCollectionViewCell
        imageDetailCell.screenshots = app?.screenshots
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 2 {
            return CGSize(width: appDetailsCollectionView.frame.width, height: 150)
        }
        
        if indexPath.row == 1 {
            var cellHight: CGFloat = 120
            if let descHight = app?.description?.heightWithConstrainedWidth(width: appDetailsCollectionView.frame.width - 8, font: UIFont.systemFont(ofSize: 11)) {
                cellHight = descHight + 15 + 5 + 5 + 0.5 + 20
            }
            return CGSize(width: appDetailsCollectionView.frame.width, height: cellHight)
        }
        
        return CGSize(width: appDetailsCollectionView.frame.width, height: 120)
    }
}
