//
//  LoadingSectionController.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit
import IGListKit

class LoadingSectionController: ListSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 60)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: LoadingCollectionViewCell.identifier, bundle: nil, for: self, at: index) as! LoadingCollectionViewCell
        cell.spinner.startAnimating()
        return cell
    }
    
    override func didUpdate(to object: Any) {
        
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
