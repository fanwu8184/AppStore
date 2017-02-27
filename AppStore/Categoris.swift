//
//  Categorys.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Categoris {
    
    var header: Category?
    private let url = "https://api.letsbuildthatapp.com/appstore/featured"
    private var cats = [Category]()
    
    func numberOfCats() -> Int { return cats.count }
    
    func fetchCat(from indexPath: IndexPath) -> Category { return cats[indexPath.row] }
    
    func loadData(completion: (() -> Void)?) {
        Alamofire.request(url).responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    self.header = Category(from: json["bannerCategory"])
                    for catData in json["categories"].arrayValue {
                        let cat = Category(from: catData)
                        self.cats.append(cat)
                    }
                case .failure(let error):
                    print(error)
            }
            completion?()
        }
    }
}
