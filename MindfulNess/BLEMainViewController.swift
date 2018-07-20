//
//  ViewController.swift
//  CollectionViewExercise
//
//  Created by imran khan on 2018-05-06.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit
import Foundation
import CoreBluetooth


class BLEMainViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let cellScaling: CGFloat = 0.6
    var integers = [1, 2, 3, 4, 5, 6]
    @IBOutlet weak var devicesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshCollectionView()
        addGestureToScrollView()
        activityIndicator.isHidden = true
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = ((view.bounds.width - cellHeight) / 2.0)
        
        self.devicesCollectionView.delegate = self
        self.devicesCollectionView.dataSource = self
        
        let layout = devicesCollectionView.collectionViewLayout  as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        devicesCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
        devicesCollectionView.dataSource = self
        devicesCollectionView.delegate = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BLEMainViewController.tapInOnCollectionView))
        gestureRecognizer.delegate = self
        devicesCollectionView.addGestureRecognizer(gestureRecognizer)
        addGestureToScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(0)) {
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showProgressBar()
    }
    
    func addGestureToScrollView() {

        let refreshRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(BLEMainViewController.drawOnviewDown))
        refreshRecognizer.direction = UISwipeGestureRecognizerDirection.down
        refreshRecognizer.delegate = self
        self.devicesCollectionView.addGestureRecognizer(refreshRecognizer)
    }
    @objc func tapInOnCollectionView() {
        performSegue(withIdentifier: "AnotherTabBarTabBarStoryBoard", sender: nil)
    }
    
    @objc func drawOnviewDown(_ recognizer: UIGestureRecognizer) {
        DispatchQueue.main.async(execute: {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        })
        if let panGesture = recognizer as? UISwipeGestureRecognizer {
            if panGesture.direction == .down {
                refreshCollectionView()
                print("Refreshed Scnanning again")
            }
        }
    }
    
    func showProgressBar() {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "progressBarStoryBoard") as UIViewController
        self.present(viewController, animated: false, completion: nil)
    }
    
    func refreshCollectionView() {
        self.devicesCollectionView.reloadData()
    }
    

    @IBAction func unwindToHomePagefromEveryWhere(segue: UIStoryboardSegue) {
    }
}

extension BLEMainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func didChange<Value>(_ changeKind: NSKeyValueChange, valuesAt indexes: IndexSet, for keyPath: KeyPath<BLEMainViewController, Value>) {
//        print("change kind\(changeKind)")
//        print("key path\(keyPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("Number of Items in sections: *****  \(section)")
//        print("Collection Data counted in numberOfItemsInSection \(collectionData.count)")
        return integers.count
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.devicesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWithIncludingApacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWithIncludingApacing
        let roundedIndex = round(index)
        offset = CGPoint(x: roundedIndex * cellWithIncludingApacing - scrollView.contentInset.left, y: -scrollView.contentInset.top
        )
        targetContentOffset.pointee = offset
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = devicesCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DevicesCollectionViewCell {
//            let peripheral = self.peripherals[indexPath.row]
//            cell.imageView.image = UIImage(named: "\(images[indexPath.row])")
            cell.imageView.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.imageView.layer.shadowOpacity = 2
            cell.imageView.layer.shadowOffset = CGSize.zero
            cell.imageView.layer.shadowRadius = 10
//            cell.integers.text = peripherals[indexPath.row].name
            return cell
        }
        return UICollectionViewCell()
    }
}


