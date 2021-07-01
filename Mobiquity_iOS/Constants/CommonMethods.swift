//
//  CommonMethods.swift
//  Mobiquity_iOS
//
//  Created by Pavan on 27/06/21.
//

import Foundation
import UIKit

class CommonMethods {
    
    internal static func networkCheck() -> Bool {
        var networkStatus = false
        let reachability = Reachability()!
        if reachability.isReachable {
            networkStatus = true
        } else {
            networkStatus = false
        }
        return networkStatus
    }
    
    internal static func ShowErrorAlert(message: String, vc: UIViewController){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
