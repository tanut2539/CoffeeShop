//
//  EmptyView.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit

protocol EmptyViewDelegate: class {
    func didReload()
}

class EmptyView: UIView {
    
    @IBOutlet weak var descLabel: UILabel!
    
    weak var delegate: EmptyViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @objc func tapReload() {
        self.delegate?.didReload()
    }
}

