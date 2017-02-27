//
//  Category.swift
//  AppStore
//
//  Created by Fan Wu on 2/25/17.
//  Copyright © 2017 8184. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {
    var name: String?
    var type: String?
    var apps = [App]()
    
    init (from json: JSON) {
        name = json["name"].stringValue
        type = json["type"].stringValue
        for appData in json["apps"].arrayValue {
            let app = App(from: appData)
            apps.append(app)
        }
    }
}
