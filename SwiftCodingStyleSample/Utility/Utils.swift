//
//  Utils.swift
//  SwiftCodingStyleSample
//
//  Created by Kerry Dong on 2022/1/3.
//  Copyright © 2022 Kerry Dong. All rights reserved.
//

import UIKit

class Utils {
    class func alert(from viewController: UIViewController, title: String?, message: String?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
