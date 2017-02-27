//
//  Extensions.swift
//  AppStore
//
//  Created by Fan Wu on 2/26/17.
//  Copyright © 2017 8184. All rights reserved.
//

import Foundation
import UIKit

extension String {
    //calculate the height of a string
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}
