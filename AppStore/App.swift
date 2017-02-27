//
//  App.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class App {
    var id: String?
    var name: String?
    var category: String?
    var imageName: String?
    var price: Double?
    var screenshots = [String]()
    var description: String?
    var seller: String?
    var updated: String?
    var version: String?
    var size: String?
    var rating: String?
    var familySharing: String?
    
    init (from json: JSON) {
        id = json["Id"].stringValue
        name = json["Name"].stringValue
        category = json["Category"].stringValue
        imageName = json["ImageName"].stringValue
        if json["Price"] != JSON.null { price = json["Price"].doubleValue }
    }
    
    func updateValue(completion: (() -> Void)?) {
        guard let appID = id else { return }
        let url = "https://api.letsbuildthatapp.com/appstore/appdetail?id=\(appID)"
        Alamofire.request(url).responseJSON { response in
            switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    for ssj in json["Screenshots"].arrayValue { if let ss = ssj.string { self.screenshots.append(ss) } }
                    self.description = json["description"].stringValue
                    self.seller = json["appInformation"][0]["Value"].stringValue
                    self.updated = json["appInformation"][2]["Value"].stringValue
                    self.version = json["appInformation"][3]["Value"].stringValue
                    self.size = json["appInformation"][4]["Value"].stringValue
                    self.rating = json["appInformation"][5]["Value"].stringValue
                    self.familySharing = json["appInformation"][6]["Value"].stringValue
                case .failure(let error):
                    print(error)
            }
            completion?()
        }
    }
}
