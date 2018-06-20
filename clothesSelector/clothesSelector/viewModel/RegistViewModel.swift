//
//  RegistViewModel.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RegistViewModel {
    let image: Variable<UIImage>
    
    init() {
        image = Variable(UIImage(named: "T-shirt.png")!)
    }
}
