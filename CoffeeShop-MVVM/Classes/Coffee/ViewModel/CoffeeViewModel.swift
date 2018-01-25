//
//  CoffeeViewModel.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import Foundation
import IGListKit

protocol CoffeeViewModelProtocol {
    
    var listCoffee: [CoffeeModel] { get set }
    var coffee: [ListDiffable] { get set }
    func getListCoffeeService()
    func getListCoffeeHandler() -> APIRequest.completionHandler
    
}

class CoffeeViewModel: BaseViewModel, CoffeeViewModelProtocol {
    
    var page: Int? = 0
    var listCoffee = [CoffeeModel]()
    var coffee = [LoadingType.refresh.rawValue as ListDiffable]
    
    func getListCoffeeService() {
        let router = Router.getListCoffee(page: page!)
        _ = APIRequest.request(withRouter: router, withHandler: getListCoffeeHandler())
    }
    
    func getListCoffeeHandler() -> APIRequest.completionHandler {
        return { [weak self] (response, error) in
            if let response = response as? CoffeeModel {
                self?.page = response.index
                if self?.coffee.contains(where: { $0 as? String == LoadingType.refresh.rawValue }) == true {
                    self?.coffee.remove(at: 0)
                }
                if self?.coffee.contains(where: { $0 as? String == LoadingType.loadmore.rawValue }) == true {
                    self?.coffee.removeLast()
                }
                self?.coffee.append(response)
                self?.delegate?.onDataDidLoad()
            } else {
                self?.delegate?.onDataDidLoad()
            }
        }
    }
    
}
