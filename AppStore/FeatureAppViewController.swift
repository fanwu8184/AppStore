//
//  ViewController.swift
//  AppStore
//
//  Created by Fan Wu on 2/20/17.
//  Copyright © 2017 8184. All rights reserved.
//

import UIKit

class FeatureAppViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AppSegueDelegate {
    
    @IBOutlet weak var featureAppCollectionView: UICollectionView!
    let cats = Categoris()

    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHud.processing(to: self.view)
        cats.loadData {
            ProgressHud.hideProcessing(to: self.view)
            self.featureAppCollectionView.reloadData()
        }
    }
    
    func showDetails(of app: App) {
        performSegue(withIdentifier: MStoryboard.segueShowDetails, sender: app)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let appDetailsVC = segue.destination as? AppDetailsViewController {
            appDetailsVC.app = sender as? App
        }
    }
    
    //-----------------------------------------COLLECTION VIEW---------------------------------------------------------
    //HEADER
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MStoryboard.headerIdentifier, for: indexPath)
        let headerView = reusableView as! HeaderCollectionReusableView
        headerView.header = cats.header
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: featureAppCollectionView.frame.width, height: 120)
    }
    
    //CELL
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.numberOfCats()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if cats.fetchCat(from: indexPath).type == "large" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.largeCategoryCellIdentifier, for: indexPath)
            let categoryCell = cell as! LargeCategoryCollectionViewCell
            categoryCell.category = cats.fetchCat(from: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MStoryboard.categoryCellIdentifier, for: indexPath)
        let categoryCell = cell as! FeatureAppCollectionViewCell
        categoryCell.category = cats.fetchCat(from: indexPath)
        categoryCell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cats.fetchCat(from: indexPath).type == "large" { return CGSize(width: featureAppCollectionView.frame.width, height: 160) }
        return CGSize(width: featureAppCollectionView.frame.width, height: 220)
    }
}

