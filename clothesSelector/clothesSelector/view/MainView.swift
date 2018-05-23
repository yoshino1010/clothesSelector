//
//  MainView.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/05/23.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    let button: UIButton
    let imageView: UIImageView
    
    override init(frame: CGRect) {
        self.button = UIButton(frame: CGRect.zero)
        self.imageView = UIImageView(frame: CGRect.zero)
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .white
        self.button.backgroundColor = .green
        
        self.addSubview(self.button)
        self.addSubview(self.imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView.snp.makeConstraints({make in
            make.width.height.equalToSuperview()
        })
        
        self.button.snp.makeConstraints({make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.center.equalToSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
