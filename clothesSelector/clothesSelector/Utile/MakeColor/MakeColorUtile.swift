//
//  MakeColorUtile.swift
//  clothesSelector
//
//  Created by 吉野　瑠 on 2018/06/22.
//  Copyright © 2018年 yoshino. All rights reserved.
//

import UIKit

class MakeColorUtile: UIView {
    var color: UIColor
    
    override init(frame: CGRect) {
        color = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        super.init(frame: .zero)
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: rect.width / 2, y: rect.height / 2), radius: rect.width / 2 - 20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
}
