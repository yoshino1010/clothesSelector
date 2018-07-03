//
//  MainViewModel.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/19.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum DataState {
    case Empty
    case SomeItem
}

struct RegistDataDetail {
    var image: UIImage = UIImage(named: "T-shirt.png")!
    var category: String = ""
}

class MainViewModel {
    let disposeBag = DisposeBag()
    let registDataState: Variable<DataState>
    var regists: Variable<[RegistDataDetail]>
    
    init() {
        registDataState = Variable(DataState.Empty)
        regists = Variable([])
        regists.asObservable().map({$0.count == 0}).subscribe(onNext: {isEmpty in
            if isEmpty {
                self.registDataState.value = .Empty
            } else {
                self.registDataState.value = .SomeItem
            }
        }).disposed(by: disposeBag)
    }
    
    func fetchData() {
        print(RegistAccessor.sharedInstance)
        
        if let data = RegistAccessor.sharedInstance.getAll() {
            regists.value = data.map({data in RegistDataDetail(image: data.image!, category: data.category)})
        }
    }
}
