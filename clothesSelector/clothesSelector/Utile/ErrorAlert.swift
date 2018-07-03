//
//  ErrorAlert.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/22.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class ErrorAlert: NSObject {
    private let alert: UIAlertController
    var errorAction: (_ action: UIAlertAction) -> Void = {_ in }
    var errorTitle = "OK"
    
    init(title: String, message: String, preferredStyle: UIAlertControllerStyle) {
        alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }
    
    func instance() -> UIAlertController{
        alert.addAction(UIAlertAction(title: errorTitle, style: .default, handler: errorAction))
        return alert
    }
}
