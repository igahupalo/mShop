//
//  CategoryRepository.swift
//  mShop
//
//  Created by Iga Hupalo on 25/04/2022.
//

import Foundation
import Alamofire

protocol CategoryRepositoryProtocol {
    // Returns list of all categories in the store.
    // - Parameters: none
    // - Returns: array of Category structs
    func getAllCategories(completionHandler: @escaping ([Category]?, Error?) -> ())
}

class CategoryRepository: CategoryRepositoryProtocol {

    public func getAllCategories(completionHandler: @escaping ([Category]?, Error?) -> ()) {
        AF.request("https://fakestoreapi.com/products/categories", method: .get)
            .responseDecodable(of: [String].self) { response in
                if let error = response.error {
                    completionHandler(nil, error)
                } else if let result = response.value {
                    let categories = result.map { Category(title: $0) }
                    completionHandler(categories, nil)
                }
            }
    }
}
