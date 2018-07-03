//
//  RegistPictureCell.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import SnapKit

class RegistPictureCell: UITableViewCell {
    let photo: UIImageView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.photo = UIImageView(frame: .zero)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.photo.contentMode = .scaleAspectFit
        
        self.addSubview(self.photo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.photo.snp.makeConstraints({make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.9).offset(self.frame.height * 0.1 * 0.5)
            make.center.equalToSuperview()
            
        })
    }
}
