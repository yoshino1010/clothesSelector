//
//  ViewController.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/05/23.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate {
    var camera: CameraUtile?
    let model = MainViewModel()
    let disposeBag = DisposeBag()
    let sorce = TableViewDataSorce()
    
    override func loadView() {
        super.loadView()
        self.view = MainView()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        camera = CameraUtile(on: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "登録済みの洋服一覧"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: nil, action: nil)
        
        let view = self.view as! MainView
        view.registButton.addTarget(self, action: #selector(startCamera), for: .touchUpInside)
        view.registList.delegate = self
        
        modelRxInit(view: view)
        cameraRxInit()
    }
    
    private func modelRxInit(view: MainView) {
        // tableviewがからの場合EmptyViewを表示するようにしている
        model.registDataState.asObservable().subscribe(onNext: {state in
            switch state {
            case .Empty:
                view.emptyText.isHidden = false
                view.registList.isHidden = true
            case .SomeItem:
                view.emptyText.isHidden = true
                view.registList.isHidden = false
            }
        }).disposed(by: disposeBag)
        
        model.images.asObservable().bind(to: view.registList.rx.items(dataSource: sorce)).disposed(by: disposeBag)
    }
    
    private func cameraRxInit() {
        // カメラの画像をviewModelへ追加している
        camera?.image.asObservable().subscribe(onNext: {image in
            if let image = image {
                self.model.addImage(image: image)
            }
        }).disposed(by: disposeBag)
    }
    
    // カメラ画面への遷移処理を書く
    @objc func startCamera(sender: Any) {
        //camera?.startedCamera()
        //let setting = RegistController()
        let test = PickerViewTestController()
        self.navigationController?.pushViewController(test, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

