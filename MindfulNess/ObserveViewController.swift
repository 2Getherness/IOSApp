//
//  ObserveViewController.swift
//  MindfulNess
//
//  Created by imran khan on 2018-05-03.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit

class ObserveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
 //       setBackButtonNavBar(title: "Observe")
    }
    
    
    func setBackButtonNavBar(title: String){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: nil)
//        navigationController?.navigationBar.backIndicatorImage = image
        
    }

    @IBAction func homeViewControllerStoryboard() {
        self.performSegue(withIdentifier: "HomeViewControllerStoryboard", sender: self)
    }
    

}
