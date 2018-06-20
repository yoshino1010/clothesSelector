//
//  RegistView.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/05/26.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class RegistView: UIView {
    let settingList: UITableView
    
    override init(frame: CGRect) {
        self.settingList = UITableView(frame: CGRect.zero, style: .grouped)
        super.init(frame: CGRect.zero)
        
        self.settingList.register(RegistPictureCell.self, forCellReuseIdentifier: "photo")
        self.settingList.register(UITableViewCell.self, forCellReuseIdentifier: "detail")
        self.settingList.register(UITableViewCell.self, forCellReuseIdentifier: "regist")
        
        self.addSubview(self.settingList)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.settingList.snp.makeConstraints({make in
            make.width.height.equalToSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
