//
//  CameraUtile.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/05/23.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import RxSwift

enum CameraError: Error {
    case protocolNotSet
}

class CameraUtile: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let controller: UIViewController
    var image: Variable<UIImage?>
    
    
    init(on controller: UIViewController) {
        self.controller = controller
        image = Variable(nil)
    }
    
    // カメラの起動
    func startedCamera() {
        let sourceType: UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            present(controller: cameraPicker)
        } else {
            print("error")
        }
    }
    
    func present(controller: UIImagePickerController) {
        self.controller.present(controller, animated: true, completion: nil)
    }
    
    // 写真を取得
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image.value = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        print("close")
    }
}
