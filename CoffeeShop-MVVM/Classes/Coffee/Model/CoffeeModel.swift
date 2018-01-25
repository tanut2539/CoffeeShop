//
//  CoffeeModel.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import UIKit
import IGListKit

class CoffeeModel : BaseModel {
    
    var id: Int?
    var name: String?
    var price: Int?
    var image: String?
    var details: String?
    var nextCoffeeAvailable: Bool?
    var index: Int?
    var coffeeList = [CoffeeModel]()
    
    required init(withDictionary dict: AnyObject) {
        super.init(withDictionary: dict)
        
        if let data = dict["coffee"] as? [[String: AnyObject]] {
            self.coffeeList = data.map({ CoffeeModel.init(withDictionary: $0 as AnyObject) })
        }
        
        self.id = dict["id"] as? Int
        self.name = dict["name"] as? String
        self.price = dict["price"] as? Int
        self.image = dict["image"] as? String
        self.details = dict["details"] as? String
        self.nextCoffeeAvailable = dict["nextCoffeeAvailable"] as? Bool
        self.index = dict["index"] as? Int
        
    }
    
}

extension CoffeeModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
