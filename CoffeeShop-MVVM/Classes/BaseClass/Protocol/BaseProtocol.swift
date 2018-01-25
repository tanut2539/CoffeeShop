//
//  BaseProtocol.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import Foundation

public protocol BaseViewModelDelegate: class {
    
    // Load data
    
    func onDataDidLoad()
    func onDataDidLoadErrorWithMessage(errorMessage:String)
    
    // Loading
    func showLoading()
    func hideLoading()
}
