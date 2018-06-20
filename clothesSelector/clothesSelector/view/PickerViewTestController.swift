//
//  PickerViewTestController.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class PickerViewTestController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var pickerUtil: PickerUtil?
    let testData = ["test1", "test2", "test3"]
    
    override func loadView() {
        super.loadView()
        self.view = PickerTestView()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        print(UIScreen.main.bounds.height * 0.4)
        //pickerUtil = PickerMainView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - UIScreen.main.bounds.height * 0.4, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        pickerUtil = PickerUtil(controller: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! PickerTestView
        view.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        view.button.setTitle("テスト", for: .normal)
        view.button.setTitleColor(.black, for: .normal)
        
        pickerUtil?.dataSorce = self
        pickerUtil?.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    @objc func tapButton(sender: Any) {
        pickerUtil?.bottomUp()
    }
}
