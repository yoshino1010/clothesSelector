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

enum Category {
    case shirt
    case pants
    case unknown
}

class RegistViewModel {
    let image: Variable<UIImage>
    let category: Variable<String>
    let categoryList = ["シャツ", "ズボン", "未指定"]
    
    init() {
        image = Variable(UIImage(named: "T-shirt.png")!)
        category = Variable("未指定")
    }
    
    func registing() -> Bool{
        let data = RegistAccessor.sharedInstance.create()
        data.image = image.value
        data.category = category.value
        return RegistAccessor.sharedInstance.set(data: data)
    }
}
