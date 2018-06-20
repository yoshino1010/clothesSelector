//
//  PicerTestView.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class PickerTestView: UIView {
    let button: UIButton
    override init(frame: CGRect) {
        button = UIButton(frame: .zero)
        super.init(frame: .zero)
        
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = CGFloat(1)
        
        self.backgroundColor = .white
        
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.snp.makeConstraints({make in
            make.width.equalTo(100)
            make.height.equalTo(60)
            make.center.equalToSuperview()
        })
    }
    
}
