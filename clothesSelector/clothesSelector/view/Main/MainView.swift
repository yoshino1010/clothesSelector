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
    let registList: UITableView
    let registButton: UIButton
    let emptyText: UILabel
    
    override init(frame: CGRect) {
        self.registButton = UIButton(frame: CGRect.zero)
        self.registList = UITableView(frame: CGRect.zero, style: .plain)
        self.emptyText = UILabel(frame: CGRect.zero)
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .white
        
        self.registList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.registList.tableFooterView = UIView(frame: CGRect.zero)
        self.registList.layoutMargins = UIEdgeInsets.zero
        self.registList.separatorInset = UIEdgeInsets.zero
        
        
        self.registButton.backgroundColor = .orange
        self.registButton.setTitle("服を登録する", for: .normal)
        self.registButton.layer.cornerRadius = 20
        
        self.emptyText.text = "登録されていません"
        self.emptyText.isHidden = false
        self.emptyText.textAlignment = .center
        self.emptyText.textColor = .lightGray
        
        self.addSubview(self.registList)
        self.addSubview(self.registButton)
        self.addSubview(self.emptyText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.registList.snp.makeConstraints({make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.top.equalToSuperview()
        })
        
        self.registButton.snp.makeConstraints({[weak self] make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.top.equalTo((self?.registList.snp.bottom)!).offset((self?.frame.height)! * (50 / (self?.frame.height)!))
            make.centerX.equalToSuperview()
        })
        
        self.emptyText.snp.makeConstraints({make in
            make.width.height.equalToSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
