//
//  FirstCell.swift
//  thmanyah
//
//  Created by Fadel on 14/05/1443 AH.
//

import UIKit

class CellBannersImages: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func addDataCell(imageNamed:String) {
        imageView.image = UIImage(named: imageNamed)
    }
    
    
}
