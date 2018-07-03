//
//  CameraUtile.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/05/23.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import RxSwift
import AVFoundation

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
        
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized: // アクセス許可あり
            print("アクセス許可あり")
        case .restricted: // ユーザー自身にカメラへのアクセスが許可されていない
            print("ユーザー自身にカメラへのアクセスが許可されていない")
            cameraAlert(message: "ユーザーにカメラへのアクセス許可がされていません。")
            return
        case .notDetermined: // まだアクセス許可を聞いていない
            print("まだアクセス許可を聞いていない")
        case .denied: // アクセス許可されていない
            print("アクセス許可されていない")
            cameraAlert(message: "アクセスが許可されていません。")
            return
        }
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
             let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            present(controller: cameraPicker)
        } else {
            errorAlert()
        }
        
    }
    
    private func cameraAlert(message: String) {
        let alert = DefaultAlert(title: "カメラへのアクセス", message: message, preferredStyle: .alert)
        alert.defaultTitle = "設定"
        alert.defaultActionDetail = { action in
            if let url = URL(string: "App-Prefs:root=Privacy") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        controller.present(alert.instance(), animated: true, completion: nil)
    }
    
    private func errorAlert() {
        let alert = ErrorAlert(title: "エラー", message: "カメラを起動できません。", preferredStyle: .alert)
        controller.present(alert.instance(), animated: true, completion: nil)
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
