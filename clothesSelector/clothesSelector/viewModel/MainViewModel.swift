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

class MainViewModel {
    let disposeBag = DisposeBag()
    let registDataState: Variable<DataState>
    var images: Variable<[UIImage]>
    
    init() {
        registDataState = Variable(DataState.Empty)
        images = Variable([])
        images.asObservable().map({$0.count == 0}).subscribe(onNext: {isEmpty in
            if isEmpty {
                self.registDataState.value = .Empty
            } else {
                self.registDataState.value = .SomeItem
            }
        }).disposed(by: disposeBag)
    }
    
    func addImage(image: UIImage) {
        images.value.append(image)
    }
}
