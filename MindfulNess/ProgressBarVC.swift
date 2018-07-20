//
//  ProgressBarVC.swift
//  MindfulNess
//
//  Created by imran khan on 2018-03-26.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class ProgressBarVC: UIViewController {
 
    @IBOutlet weak var progressB: MBCircularProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressBar), userInfo: nil, repeats: false)

    }
    
    @objc func updateProgressBar() {
        
            UIView.animate(withDuration: 1.0, animations: {
                self.progressB.value = 100
            }, completion: { (animationgComplete) in
                self.dismiss(animated: true, completion: nil)
            })
    }
}
