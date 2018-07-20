//
//  Master.swift
//  MindfulNess
//
//  Created by imran khan on 2018-05-15.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import Foundation
import UIKit

class Master {
    
    static func makeBtn(_ button: UIButton){
        let button = button
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
    }
    
    static func makeLabel(_ label: UILabel) {
        let label = label
        label.layer.cornerRadius = 10
    }
    
    static func makeView(_ view: UIView) {
        let view = view
        view.layer.cornerRadius = 10
    }
    
    static func backgroundView(_ view: UIView) {
        let view = view
        view.layer.cornerRadius = 10
    }
    
    static func makeFont(_ font: UIFont) {
        var font = font
        font = UIFont(name: "Helvetica Neue", size: 14.0)!
    }
    
    static func make(_ view: UIView) {
        let view = view
        view.layer.cornerRadius = 10
    }
}



