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
    let model = MainViewModel()
    let disposeBag = DisposeBag()
    let sorce = TableViewDataSorce()
    
    override func loadView() {
        super.loadView()
        self.view = MainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.fetchData()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "登録済みの洋服一覧"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "戻る", style: .plain, target: nil, action: nil)
        
        let view = self.view as! MainView
        view.registButton.addTarget(self, action: #selector(toRegistView), for: .touchUpInside)
        view.registList.delegate = self
        
        modelRxInit(view: view)
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
        
        model.regists.asObservable().bind(to: view.registList.rx.items(dataSource: sorce)).disposed(by: disposeBag)
    }
    
    @objc func toRegistView(sender: Any) {
        let controller = RegistController()
        navigationController?.pushViewController(controller, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

