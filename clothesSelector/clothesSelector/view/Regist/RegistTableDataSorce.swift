//
//  RegistTableDataSorce.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/20.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Setting: Int {
    case photo = 0
    case detail = 1
    case regist = 2
}

class RegistTableDataSorce: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = UIImage
    var item: UIImage?
    private let settingItems = ["袖の長さ", "色"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch  IndexPath(row: 0, section: section).settingEnum{
        case .photo:
            return 1
        case .detail:
            return settingItems.count
        case .regist:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.settingEnum {
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: "photo") as! RegistPictureCell
            cell.photo.image = item!
            return cell
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detail")!
            cell.textLabel?.text = settingItems[indexPath.row]
            return cell
        case .regist:
            let cell = tableView.dequeueReusableCell(withIdentifier: "regist")!
            cell.textLabel?.text = "登録"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .red
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == Setting.detail.rawValue {
            return "服の情報"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<UIImage>) {
        Binder(self) { datasorce, element in
            datasorce.item = element
            tableView.reloadData()
            }
            .on(observedEvent)
    }
}

extension IndexPath {
    var settingEnum: Setting {
        switch section {
        case Setting.photo.rawValue:
            return Setting.photo
        case Setting.detail.rawValue:
            return Setting.detail
        default:
            return Setting.regist
        }
    }
}
