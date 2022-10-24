//
//  ProductRepository.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import Foundation
import Alamofire

protocol ProductRepositoryProtocol {
    // Returns list of all products in the store.
    // - Parameters: none
    // - Returns: array of Product structs
    func getAllProducts(completionHandler: @escaping ([Product]?, Error?) -> ())

    // Returns a product with a given id or nothing if there is no product with such an id.
    // - Parameters: id
    // - Returns: a Product struct or nil
    func getProduct(id: Int, completionHandler: @escaping (Product?, Error?) -> ())

    // Returns list of products of specified categorye.
    // - Parameters: String with category name
    // - Returns: array of Product structs
    func getProducts(categoryName: String, completionHandler: @escaping ([Product]?, Error?) -> ())

    func getSampleProducts(completionHandler: @escaping ([Product]?, Error?) -> ())
}

class ProductRepository: ProductRepositoryProtocol {

    public func getAllProducts(completionHandler: @escaping ([Product]?, Error?) -> ()) {
        AF.request("https://fakestoreapi.com/products", method: .get)
            .responseDecodable(of: [Product].self) { response in
                if let error = response.error {
                    completionHandler(nil, error)
                } else if let result = response.value {
                    completionHandler(result, nil)
                }
            }
    }

    public func getSampleProducts(completionHandler: @escaping ([Product]?, Error?) -> ()) {
        AF.request("https://fakestoreapi.com/products?limit=5", method: .get)
            .responseDecodable(of: [Product].self) { response in
                if let error = response.error {
                    completionHandler(nil, error)
                } else if let result = response.value {
                    completionHandler(result, nil)
                }
            }
    }

    public func getProduct(id: Int, completionHandler: @escaping (Product?, Error?) -> ()) {
//        DatabaseConfig.time2 = Date().millisecondsSince1970
        AF.request("https://fakestoreapi.com/products/" + String(id), method: .get)
            .responseDecodable(of: Product.self) { response in
                if let error = response.error {
                    completionHandler(nil, error)
                }
                let result = response.value
//                DatabaseConfig.time4 = Date().millisecondsSince1970
                completionHandler(result, nil)
            }
    }

    public func getProducts(categoryName: String, completionHandler: @escaping ([Product]?, Error?) -> ()) {
//        DatabaseConfig.time2 = Date().millisecondsSince1970

        let formattedCategoryName = categoryName.replacingOccurrences(of: " ", with: "%20")
        AF.request("https://fakestoreapi.com/products/category/" + formattedCategoryName, method: .get)
            .responseDecodable(of: [Product].self) { response in
                if let error = response.error {
                    completionHandler(nil, error)
                } else if let result = response.value {
//                    DatabaseConfig.time3 = Date().millisecondsSince1970
                    completionHandler(result, nil)
                }
            }
    }
}
