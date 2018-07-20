//
//  MainTabBarViewController.swift
//  MindfulNess
//
//  Created by imran khan on 2018-04-30.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit
import CoreBluetooth

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    var connectedPeripheral: CBPeripheral!
    
    @IBOutlet var uiTabBarCollection: [UITabBar]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            self.selectedIndex = 1
    }
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 0 {
            print("first")
        } else if tabBarIndex == 1 {
            print("Second")
        } else if  tabBarIndex == 2 {
            print("Third")
        }
    }
}

//class middleTabBarItem: UITabBarController {
//    self.selectedIndex = 1
//}
