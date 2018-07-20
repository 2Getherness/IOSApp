//
//  SettingViewController.swift
//  MindfulNess
//
//  Created by imran khan on 2018-05-02.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit
import CoreBluetooth

class SettingViewController: UIViewController, CBPeripheralManagerDelegate {
    
    @IBOutlet weak var connectionInfoLabel: UILabel!
    @IBOutlet weak var settingViewLabel: UILabel!
    
    @IBOutlet weak var popUpView: UIVisualEffectView!
    @IBOutlet weak var settingBlurView: UIView!
    @IBOutlet weak var deviceDisonnectBtn: UIButton!
    @IBOutlet weak var deviceSearchBtn: UIButton!
    @IBOutlet weak var blurViewView: UIView!
    
    @IBOutlet weak var deviceSettingBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpView.isHidden = true
        Master.makeView(blurViewView)
        Master.makeBtn(deviceSearchBtn)
        Master.makeBtn(deviceSettingBtn)
        Master.makeBtn(deviceDisonnectBtn)
        
    }

    override func viewWillAppear(_ animated: Bool) {

        connectionInfoLabel.text = "You are Connected to device."
        settingViewLabel.text = "Device Connected"
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
        self.popUpView.isHidden = false
        settingBtnPressed()
        
    }
    
    @IBAction func disconnectBtn(_ sender: UIButton) {
        disconnectBtnPressed()
    }
    
    func disconnectBtnPressed() {
        deviceDisonnectBtn.isUserInteractionEnabled = false
        deviceDisonnectBtn.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        deviceDisonnectBtn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    func settingBtnPressed() {
        deviceSettingBtn.isHidden = true
        deviceDisonnectBtn.isHidden = true
    }
    
    @IBAction func searchForDeviceBtn(_ sender: UIButton) {
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewStoryBoard") as! BLEMainViewController
//        let navigationControlr = UINavigationController(rootViewController: vc)
//        self.present(navigationControlr, animated: true, completion: nil)
    }
    
    @IBAction func reutrunToMainTabBar(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "InfoViewStoryBoard", sender: self)
        print("Setting button pressed")
    }
    @IBAction func retrunToStartTabBar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        //
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        //
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            return
        }
        print("Peripheral manager is running")
    }
}

