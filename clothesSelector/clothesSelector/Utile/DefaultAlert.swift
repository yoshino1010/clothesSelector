//
//  DefaultAlert.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/21.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class DefaultAlert:  NSObject{
    private let alert: UIAlertController
    lazy var defaultActionDetail: (_ action: UIAlertAction) -> Void = {_ in }
    lazy var cancelActionDetail: (_ action: UIAlertAction) -> Void = {_ in }
    var defaultTitle: String = "OK"
    var cancelTitle: String = "キャンセル"
    
    init(title: String, message: String, preferredStyle: UIAlertControllerStyle) {
        alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }
    
    func instance() -> UIAlertController {
        alert.addAction(UIAlertAction(title: defaultTitle, style: .default, handler: defaultActionDetail))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelActionDetail))
        return alert
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
