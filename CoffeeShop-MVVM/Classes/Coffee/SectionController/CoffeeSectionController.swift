//
//  CoffeeSectionController.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit
import IGListKit
import SDWebImage
import EZSwiftExtensions

enum LoadingType: String {
    case refresh, loadmore
}

protocol CoffeeSectionControllerDelegate: class {
    
}

class CoffeeSectionController: ListSectionController {
    
    var object: CoffeeModel?
    
    override func numberOfItems() -> Int {
        return (object?.coffeeList.count)!
    }
    
    weak var delegate: CoffeeSectionControllerDelegate?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        self.minimumInteritemSpacing = 6
        self.minimumLineSpacing = 8
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = ceil(width / 2)
        return CGSize(width: itemSize - 14, height: 240)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: CoffeeCollectionViewCell.identifier, bundle: nil, for: self, at: index) as! CoffeeCollectionViewCell
        cell.coffeeLabel.text = String(describing: "\((object?.coffeeList[index].name)!)")
        cell.detailsLabel.text = String(describing: "\((object?.coffeeList[index].details)!)")
        cell.priceLabel.text = String(describing: "\((object?.coffeeList[index].price)!) ฿")
        cell.coffeeImage.sd_setImage(with: URL(string: (object?.coffeeList[index].image) ?? ""))
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? CoffeeModel
    }
    
    override func didSelectItem(at index: Int) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateVC(IssueDetailViewController.self)
//        vc?.navigationItem.title = self.object?.IssueList[index].name
//        vc?.pid = self.object?.IssueList[index].id
//        self.viewController?.pushVC(vc!)
    }
}
