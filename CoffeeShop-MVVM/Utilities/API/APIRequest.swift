//
//  APIRequest.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import Foundation
import Alamofire

class APIRequest {
    
    public typealias completionHandler = (AnyObject?, Error?) -> Void
    
    public static func request(withRouter router: CoffeeRouter, withHandler handler: @escaping completionHandler) -> Request? {
        
        return Alamofire.request(router)
            .responseJSON(completionHandler: { response in
                debugPrint(response)
                if response.request?.httpBody?.isEmpty == false {
                    print("========== Body =========")
                    print(try! JSONSerialization.jsonObject(with: (response.request?.httpBody)!, options: .mutableContainers))
                    print("======================")
                }
                switch response.result {
                case .success(let JSON):
                    ResponseHandler(JSON: JSON as AnyObject?, router: router, completionHandler: handler)
                case .failure(let error):
                    ResponseHandler(JSON: error as AnyObject?, router: router, completionHandler: handler)
                    print(error)
                }
            })
    }
    
    public static func ResponseHandler(JSON: AnyObject?, router: CoffeeRouter, completionHandler: APIRequest.completionHandler) {
        var instance: BaseModel? = nil
        if let JSON = JSON {
            instance = router.responseClass.init(withDictionary: JSON)
        }
        completionHandler(instance!, nil)
    }
    
}
