//
//  PickerViewTestController.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class PickerViewTestController: UIViewController {
    var pickerUtil: PickerUtil?
    let testData = ["test1", "test2", "test3"]
    
    override func loadView() {
        super.loadView()
        self.view = MakeColorUtile()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
