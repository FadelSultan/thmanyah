//
//  ViewController.swift
//  thmanyah
//
//  Created by Fadel on 13/05/1443 AH.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var fristCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    
    var arrayFirstCell : [String] = []
    var arraySecondCell : [String] = []
    
    // set itemForFirstCell to start from begin -100 equle x:0.0 with timer like this
    var itemForFirstCell:Float = -50
    
    var itemForSecondCell:Float = 0
    
    enum Cell {case first , second}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImagestCell()
        setupTimers()
        
//        overrideUserInterfaceStyle = .dark
    }
    
    
    private func setupTimers() {
        itemForSecondCell = 180.0 * Float(self.arraySecondCell.count) + 50
        print("itemForSecondCell \(itemForSecondCell)")
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
        // 180 is width for cell
        // when I multiplication width cell with count items of array I will get size width for collection view
        
        if itemForFirstCell > (180.0 * Float(self.arrayFirstCell.count)) {
            // reset value
            itemForFirstCell = -50
        }else {
            // 1.5 mean speed scroll when you need to up speed then plus number
            itemForFirstCell += 1.5 ;
        }
        
        if -50 < itemForSecondCell  {
            // 3.2 mean speed scroll when you need to up speed then plus number
            // I minus itemForSecondCell to start from end to begin
            itemForSecondCell -= 3.2
        }else {
            // reset value
            itemForSecondCell = 180.0 * Float(self.arraySecondCell.count) + 50
        }
        
        UIView.animate(withDuration: 10) {
            self.fristCollectionView.layoutIfNeeded()
            self.fristCollectionView.setContentOffset(CGPoint(x: Double(self.itemForFirstCell), y: 0.0), animated: true)
            
            self.secondCollectionView.layoutIfNeeded()
            self.secondCollectionView.setContentOffset(CGPoint(x: Double(self.itemForSecondCell), y: 0.0), animated: true)
        }
        
    }
    
    
//    I use same function becuase I have same count for images
//    when I have diffrent count I will use enum to fix it
//    and when I use api I will make Class to manage api and get images
    private func getImagestCell() {
        for i in 1...4 {
            arrayFirstCell.append("FirstCell/image\(i)")
            arraySecondCell.append("SecondCell/image\(i)")
        }
    }
    
}

//Mark:- UICollectionViewDataSource -> to add data to collectionView
extension HomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == fristCollectionView {
            return arrayFirstCell.count
        }else {
            return arraySecondCell.count
        }
    }
    
    // I use the same class to do this collection becuse I have the same job
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == fristCollectionView {
            return cellCollectionView(collectionView, Identifier: "FristCell", indexPath: indexPath, imageNamed: arrayFirstCell[indexPath.row])
        }else {
            return cellCollectionView(collectionView, Identifier: "SecondCell", indexPath: indexPath, imageNamed: arraySecondCell[indexPath.row])
        }
    }
    
    
    //
    private func cellCollectionView(_ collectionView: UICollectionView,Identifier:String , indexPath:IndexPath , imageNamed:String) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as? CellBannersImages else {
            return UICollectionViewCell()
        }
        cell.addDataCell(imageNamed: imageNamed)
        return cell
    }
    
}

