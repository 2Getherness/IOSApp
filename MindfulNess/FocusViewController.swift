//
//  FocusViewController.swift
//  MindfulNess
//
//  Created by imran khan on 2018-05-03.
//  Copyright © 2018 upgradingmachine. All rights reserved.
//

import UIKit
import MBCircularProgressBar
import CoreMotion

class FocusViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var numberCollectionView: UICollectionView!
    @IBOutlet weak var circularProgressView: MBCircularProgressBarView!
    @IBOutlet weak var flipPhoneLabel: UILabel!
    
    var timer = Timer()
    var seconds: Int = 60
    var sessionTime : Int = 0
    var isTimerRunning = false
    var isTimerResumed = false
    
    var motionManager = CMMotionManager()
    let cellScaling: CGFloat = 0.3
    var progress : CGFloat = 0.0
    var sessionTimeInitialValue: Int = 0
    var obstacleViews : [UIView] = []
    var pageNumber = 0
    var numbersArray = [05, 02, 15, 20, 30]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
        numberCollectionView.allowsSelection = true
        numberCollectionView.allowsMultipleSelection = false
        circularProgressView.unitString = ""
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.height * cellScaling)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = ((view.bounds.width - cellHeight) / 2.0)
        let layout = numberCollectionView.collectionViewLayout  as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        numberCollectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
//        setBackButtonNavBar(title: "Focus", image: #imageLiteral(resourceName: "arrow"))

        if pageNumber == 0 {
            sessionTime = numbersArray[pageNumber] - 1
            sessionTimeInitialValue = sessionTime
            progress = 0
            print("Session Time in View did load : \(String(describing: sessionTime.description))")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.accelerometerUpdateInterval = 1
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (Data, Error) in
            if let myData = Data {
                if myData.acceleration.z >= 0.95 {
                    self.updateTime()
                } else if myData.acceleration.z <= 0.95 {
                }
            }
        }
    }
    
    @objc func updateTime() {
        print("Hash Value***** \(seconds.hashValue)")
        self.flipPhoneLabel.text = "Flip you phone to continue"
        numberCollectionView.isHidden = true
        if sessionTime == 0 {
            numberCollectionView.isHidden = false
        } else {
            seconds -= 1
        if seconds == 0{
            
            sessionTime -= 1
            seconds = 60
        }
        progress += 100 / (CGFloat(sessionTimeInitialValue * 60))
            circularProgressView.unitString = String(sessionTime) + ":" + String(seconds) + "min"
            print("Progress*****\(progress)")
            print("SessionTime*****\(sessionTime)")
            
        circularProgressView.value = CGFloat(progress)
        }
    }
    
    @IBAction func showHelpPage(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "HelpPageIdentifier", sender: self)
    }
    
    @IBAction func homeViewControllerStoryboard() {
        self.performSegue(withIdentifier: "HomeViewStoryboard", sender: self)
    }

}
extension FocusViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected number from array: \(numbersArray[indexPath.row])")
//        sessionTime = numbersArray[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = numberCollectionView.dequeueReusableCell(withReuseIdentifier: "NumberCollectoinCell", for: indexPath) as! NumberCollectionViewCell
        cell.numbersLabel.text = "\(numbersArray[indexPath.row])"
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.numberCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWithIncludingApacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWithIncludingApacing
        let roundedIndex = round(index)
        print("Checking scrollView page index: \(Int(roundedIndex))")
        let pageN = Int(roundedIndex)
        pageNumber = pageN
        if pageNumber == pageN {
        sessionTime = numbersArray[pageNumber]
            print("Session Time in ScrollViewWillEndDragging : \(sessionTime.hashValue))")
        }
        offset = CGPoint(x: roundedIndex * cellWithIncludingApacing - scrollView.contentInset.left, y: 0
            //-scrollView.contentInset.top
        )
        targetContentOffset.pointee = offset
    }
}
