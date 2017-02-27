//
//  ProgressHud.swift
//  Managee
//
//  Created by Fan Wu on 12/7/16.
//  Copyright © 2016 8184. All rights reserved.
//

import Foundation
import MBProgressHUD
import UIKit

class ProgressHud {
    
    static let duration = 3.0
    
    //show a processing hud with a message, you can choose to block users interaction or not
    class func processing(to target: UIView, msg: String? = nil, block: Bool = false) {
        let hud = MBProgressHUD.showAdded(to: target, animated: true)
        hud.isUserInteractionEnabled = block
        hud.label.text = msg
    }
    
    //show a processing hud with a message and turn it off after duration, you can choose to block users interaction or not
    class func processingWithDuration(to target: UIView, msg: String? = nil, block: Bool = false) {
        let hud = MBProgressHUD.showAdded(to: target, animated: true)
        hud.isUserInteractionEnabled = block
        hud.label.text = msg
        hud.hide(animated: true, afterDelay: TimeInterval(ProgressHud.duration))
    }
    
    //hide huds
    class func hideProcessing(to target: UIView) { MBProgressHUD.hide(for: target, animated: true) }
    
    //show a message hud with a title and a body, you can choose to block users interaction or not
    class func message(to target: UIView, msgTitle: String = Constants.oops, msg: String? = nil, block: Bool = false) {
        let hud = MBProgressHUD.showAdded(to: target, animated: true)
        hud.isUserInteractionEnabled = block
        hud.mode = MBProgressHUDMode.text
        hud.label.text = msgTitle
        hud.detailsLabel.text = msg
        hud.hide(animated: true, afterDelay: TimeInterval(ProgressHud.duration))
    }
}
