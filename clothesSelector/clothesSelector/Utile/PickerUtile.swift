//
//  PickerUtile.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class PickerUtil {
    private weak var target: UIViewController?
    private let picker: PickerMainView
    private let item: UINavigationItem
    private let size = CGFloat(0.3)
    private let screen = UIScreen.main.bounds
    
    var dataSorce: UIPickerViewDataSource? = nil {
        didSet {
            picker.pickerView.dataSource = dataSorce
        }
    }
    var delegate: UIPickerViewDelegate? = nil {
        didSet {
            picker.pickerView.delegate = delegate
        }
    }
    
    init(controller: UIViewController) {
        target = controller
        item = UINavigationItem(title: "")
        
        picker = PickerMainView(frame: CGRect(x: 0, y: screen.height, width: screen.width, height: screen.height * size))
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerDone))
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(pickerCancel))
        
        item.setRightBarButton(done, animated: true)
        item.setLeftBarButton(cancel, animated: true)
        picker.bar.pushItem(item, animated: true)
    }
    
    @objc func pickerDone(sender: Any) {
        print("done")
        removePicker()
    }
    
    @objc func pickerCancel(sender: Any) {
        print("cancel")
        removePicker()
    }
    
    func removePicker() {
        UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
            self.picker.transform = CGAffineTransform(translationX: 0, y: self.screen.height * self.size)
        }, completion: { _ in
            self.picker.removeFromSuperview()
        })
    }
    
    func bottomUp() {
        if !self.picker.isDescendant(of: (self.target?.view)!) {
            self.target?.view.addSubview(self.picker)
            UIView.animate(withDuration: 0.3, delay: 0.0, animations: { [weak self] in
                (self?.picker.transform = CGAffineTransform(translationX: 0, y: -(self?.screen.height)! * (self?.size)!))!
            }, completion: nil)
        }
    }
}
