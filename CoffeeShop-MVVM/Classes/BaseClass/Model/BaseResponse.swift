//
//  BaseResponse.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import Foundation


public class BaseModel: NSObject {
    
    var status : String?

    public required init(withDictionary dict: AnyObject) {
        self.status = dict["status"] as? String
    }
}
