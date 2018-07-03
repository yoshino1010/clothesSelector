//
//  AccessorBase.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/24.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import Foundation
import RealmSwift

class AccessorBase {
    let realm: Realm
    
    init() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
    }
    
    func set(data: Object) -> Bool {
        do {
            try realm.write {
                realm.add(data, update: true)
            }
            return true
        } catch {
            print("Accessor Base Error")
        }
        return false
    }
    
    func delete(data: Object) -> Bool{
        do {
            try realm.write {
                realm.delete(data)
            }
            return true
        } catch {
            print("Accessor Base Error")
        }
        return false
    }
}
