//
//  AccessorProtocol.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/24.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import Foundation
import RealmSwift

protocol AccessorProtocol {
    associatedtype ObjectType: Object
    func getByID(id: String) -> ObjectType?
    func getAll() -> Results<ObjectType>?
    func set(data: Object) -> Bool
    func delete(data: Object) -> Bool
}
