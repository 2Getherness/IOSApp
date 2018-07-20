//
//  HomeViewController.swift
//  MindfulNess
//
//  Created by imran khan on 2018-05-03.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var focusBtn: UIButton!
    @IBOutlet weak var observeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.greetingLabel.text = "Hello, Mindful-team"
        Master.makeBtn(focusBtn)
        Master.makeBtn(observeBtn)
    }
    
    
    @IBAction func unwindToHomeFromFocusAndObservePages(segue: UIStoryboardSegue) {
    }
}
