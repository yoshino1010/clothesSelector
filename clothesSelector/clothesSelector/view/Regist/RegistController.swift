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
    var picker: PickerUtil?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        sorce = RegistTableDataSorce()
        model = RegistViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        camera = CameraUtile(on: self)
        picker = PickerUtil(controller: self)
        picker?.dataSorce = self
        picker?.delegate = self
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
        
        picker?.firstSelected = 2
        camera?.image.asDriver().filter({$0 != nil}).drive(onNext: {image in
            print("image set")
            self.model.image.value = image!
        }).disposed(by: disposeBag)
        
        Observable.combineLatest(model.image.asObservable(), model.category.asObservable(), resultSelector: {
            ($0, $1)
        }).bind(to: view.settingList.rx.items(dataSource: sorce)).disposed(by: disposeBag)
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
            picker?.bottomUp()
        case .regist:
            print("登録")
            if model.registing() {
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
