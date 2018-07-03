//
//  RegistData.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/24.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import Foundation
import RealmSwift

class RegistData: Object {
    @objc dynamic var id = 0
    @objc private dynamic var imageData: NSData? = nil
    @objc dynamic private var _image: UIImage? = nil
    @objc dynamic private var toOriginalMagnification: CGFloat = 1
    @objc dynamic var image: UIImage? {
        set {
            self._image = newValue
            if let value = newValue {
                let data: NSData = UIImagePNGRepresentation(value)! as NSData
                let length = CGFloat(data.length / 1024 / 1024)
                if length > 16 {
                    self.toOriginalMagnification = 16 / length
                    self.imageData = UIImagePNGRepresentation(value.resized(withPercentage: toOriginalMagnification)!)! as NSData
                    self._image = value.resized(withPercentage: toOriginalMagnification)
                    print((self.imageData?.length)! / 1024 / 1024)
                } else {
                    self.imageData = data
                }
            }
        }
        get {
            if let image = self._image {
                if self.toOriginalMagnification == 1 {
                    return image
                } else {
                    return image.resized(withPercentage: 1 / toOriginalMagnification)
                }
            }
            if self.imageData != nil {
                if self.toOriginalMagnification == 1 {
                    self._image = UIImage(data: self.imageData! as Data)
                    return self._image
                } else {
                    self._image = UIImage(data: self.imageData! as Data)
                    return self._image?.resized(withPercentage: 1 / toOriginalMagnification)
                }
                
            }
            return nil
        }
    }
    @objc dynamic var category: String = ""
    
    override static func ignoredProperties() -> [String] {
        return ["image", "_image"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
