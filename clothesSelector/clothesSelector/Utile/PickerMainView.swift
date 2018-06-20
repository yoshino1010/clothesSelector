//
//  PickerMainView.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class PickerMainView: UIView {
    let pickerView: UIPickerView
    let bar: UINavigationBar
    override init(frame: CGRect) {
        pickerView = UIPickerView(frame: .zero)
        bar = UINavigationBar(frame: .zero)
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        
        self.addSubview(pickerView)
        self.addSubview(bar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pickerView.snp.makeConstraints({make in
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        })
        
        bar.snp.makeConstraints({make in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
        })
    }

}
