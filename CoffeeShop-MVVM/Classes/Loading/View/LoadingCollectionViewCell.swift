//
//  LoadingCollectionViewCell.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LoadingCollectionViewCell"
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        spinner.startAnimating()
    }
}
