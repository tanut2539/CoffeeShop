//
//  CoffeeCollectionViewCell.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit

class CoffeeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CoffeeCollectionViewCell"
    
    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var coffeeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceLabel.clipsToBounds = true
        priceLabel.layer.cornerRadius = 14.0

    }
    
}
