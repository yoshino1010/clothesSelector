//
//  RegistAccessor.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/24.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import Foundation
import RealmSwift

class RegistAccessor: AccessorBase, AccessorProtocol {
    typealias ObjectType = RegistData
    
    static let sharedInstance = RegistAccessor()
    private override init() {
        super.init()
    }
    
    func getByID(id: String) -> RegistData? {
        let models = super.realm.objects(RegistData.self).filter("id = '\(id)'")
        if models.count > 0 {
            return models[0]
        } else {
            return nil
        }
    }
    
    func create() -> RegistData {
        let data = RegistData()
        data.id = lastId()
        return data
    }
    
    private func lastId() -> Int {
        if let user = super.realm.objects(RegistData.self).last {
            return user.id + 1
        } else {
            return 1
        }
    }
    
    func getAll() -> Results<RegistData>? {
        return super.realm.objects(RegistData.self)
    }
}
