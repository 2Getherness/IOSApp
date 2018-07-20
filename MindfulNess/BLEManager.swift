////
////  BLEMANAGER.swift
////  MindfulNess
////
////  Created by imran khan on 2018-04-24.
////  Copyright © 2018 upgradingmachine. All rights reserved.
////
//
//import Foundation
//import UIKit
//import CoreBluetooth
//import MobileCoreServices
//var peripherals : [CBPeripheral] = []
//var foundedPeripheral : CBPeripheral!
//var RSSIs = [NSNumber]()
//var data = NSMutableData()
//
//class BLEManager {
//    var centralManager : CBCentralManager!
//    var bleHandler : BLEHandler // delegate
//    init() {
//        self.bleHandler = BLEHandler()
//        centralManager = CBCentralManager(delegate: self.bleHandler, queue: nil)
//    }
//    
//    @objc func cancelScan() {
//        centralManager.stopScan()
//    }
//    
//    func connectToDevice() {
//        centralManager.connect(foundBLEPeripheral!, options: nil)
//    }
//    
//    func disconnectAllConnection() {
//        centralManager.cancelPeripheralConnection(foundBLEPeripheral!)
//    }
//    
//}
//
//class BLEHandler : NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
//    var bleManager : BLEManager!
//    override init (manager: BLEManager) {
//        super.init()
//        self.bleManager = manager
//    }
//    
//    func centralManager(_ central: CBCentralManager, didConnect connectedPeripheral: CBPeripheral) {
//        
//        data.length = 0
//        connectedPeripheral.delegate = self
//        connectedPeripheral.discoverServices([BLEService_UUID])
//
//        foundBLEPeripheral = connectedPeripheral
//
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let uartViewController = storyboard.instantiateViewController(withIdentifier: "SelectedDeviceVCStoryBoard") as! SelectedDeviceVC
////        uartViewController.selectedPeripheral = connectedPeripheral
////        DispatchQueue.main.async {
////            self.connectToDevice()
////            print("Connecting to blePeripheral *****************")
////        }
////        print("Navigating to Selected Device screen")
////        self.navigationController?.pushViewController(uartViewController, animated: true)
//    }
//    
//    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
//        if error != nil {
//            print("Failed to connect to peripheral")
//            return
//        }
//    }
//    
//    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
//        
//    }
//    
//    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
//        if ((error) != nil) {
//            return
//        }
//        guard let services = peripheral.services else {
//            return
//        }
//        for service in services {
//            peripheral.discoverCharacteristics(nil, for: service)
//            print("Discovered Services: \(services)")
//        }
//    }
//    
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,advertisementData: [String : Any], rssi RSSI: NSNumber) {
//        print("\(String(describing: peripheral.name)) : \(RSSI)")
//        foundedPeripheral = peripheral
//        peripherals.append(peripheral)
//        RSSIs.append(RSSI)
//        dump("Discovered RSSI and kCBAdvDataLocalName \(String(describing: advertisementData.keys))")
//        peripheral.delegate = self
//        if foundedPeripheral == nil {
//        }
//    }
//    
//    func centralManagerDidUpdateState(_ central: CBCentralManager){
//        switch (central.state)
//        {
//        case .unsupported:
//            print("BLE is not supported")
//        case.unauthorized:
//            print("BLE is unauthorized")
//        case.unknown:
//            print("BLE is Unknown")
//        case.resetting:
//            print("BLE is Resetting")
//        case.poweredOff:
//            print("Bluetooth Disabled- Make sure your Bluetooth is turned on")
////            let alertController = UIAlertController(title: "Oh No!!", message: "Connection error",preferredStyle: UIAlertControllerStyle.alert)
////
////            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
//            
////            let alertVC = UIAlertController(title: "Bluetooth is not enabled", message: "Make sure that your bluetooth is turned on", preferredStyle: UIAlertControllerStyle.alert)
////            let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction) -> Void in
////
////            })
////            alertVC.addAction(action)
////
////            UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
//            BLEManager.cancelScan(bleManager)
//            BLEManager.connectToDevice(bleManager)
//            
//        case.poweredOn:
//            print("BLE service is powered on")
//            central.scanForPeripherals(withServices: [BLEService_UUID], options: nil)
//            Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(BLEManager.cancelScan), userInfo: nil, repeats: false)
//        default:
//            print("default state")
//        }
//    }
//}
