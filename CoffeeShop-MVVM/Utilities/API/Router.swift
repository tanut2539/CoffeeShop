//
//  Router.swift
//  CoffeeShop-MVVM
//
//  Created by tanut2539 on 1/25/18.
//  Copyright © 2018 Tanut Leelaparsert. All rights reserved.
//

import Foundation
import Alamofire

public protocol CoffeeRouter: URLRequestConvertible {
    
    var url: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var parameters: [String: AnyObject]? { get }
    var responseClass: BaseModel.Type { get }
    func asURLRequest() throws -> URLRequest
    
}

public enum Router: CoffeeRouter {
    
    case getListCoffee(page: Int)

}

extension Router {

    public var url: String {
        return "http://demo0525859.mockable.io/"
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getListCoffee:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .getListCoffee:
            return "/api/v1/coffee"
        }
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case .getListCoffee(let page):
            let params = ["page": page]
            return params as [String : AnyObject]
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    public var responseClass: BaseModel.Type {
        switch self {
        case .getListCoffee:
            return CoffeeModel.self
        default:
            return BaseModel.self
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let baseUrl = try url.asURL()
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getListCoffee:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    
}

enum asd: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        
        return urlRequest!
    }
}
