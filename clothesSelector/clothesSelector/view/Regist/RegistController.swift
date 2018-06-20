//
//  RegistController.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/05/26.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegistController: UIViewController, UITableViewDelegate {
    let sorce: RegistTableDataSorce
    let model: RegistViewModel
    let disposeBag = DisposeBag()
    var camera: CameraUtile?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        sorce = RegistTableDataSorce()
        model = RegistViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        camera = CameraUtile(on: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = RegistView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "登録"
        
        let view = self.view as! RegistView
        view.settingList.delegate = self
        
        camera?.image.asDriver().filter({$0 != nil}).drive(onNext: {image in
            print("image set")
            self.model.image.value = image!
        }).disposed(by: disposeBag)
        
        model.image.asObservable().bind(to: view.settingList.rx.items(dataSource: sorce)).disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.settingEnum {
        case .photo:
            return CGFloat(UIScreen.main.bounds.height * 0.35)
        case .detail:
            return CGFloat(44)
        case .regist:
            return CGFloat(44)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.settingEnum {
        case .photo:
            camera?.startedCamera()
        case .detail:
            break
        case .regist:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
