//
//  TableViewDataSorce.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/19.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewDataSorce: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [UIImage]
    var images: [UIImage] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "image\(indexPath.row)"
        cell.imageView?.image = images[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[UIImage]>) {
        Binder(self) { datasorce, element in
            datasorce.images = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
}
