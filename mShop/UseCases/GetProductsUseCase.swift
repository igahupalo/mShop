//
//  GetProductsUseCase.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import Foundation
import UIKit

protocol GetProductsUseCaseProtocol {
    func getAllProducts(completionHandler: @escaping ([Product]) -> ())
    func getSampleProducts(completionHandler: @escaping ([Product]) -> ())
    func getProduct(id: Int, completionHandler: @escaping (Product?) -> ())
    func getProducts(category: Category, completionHandler: @escaping ([Product]) -> ())
}

class GetProductsUseCase: GetProductsUseCaseProtocol {
    private var productRepository: ProductRepositoryProtocol

    init (productRepository: ProductRepositoryProtocol) {
        self.productRepository = productRepository
    }

    public func getAllProducts(completionHandler: @escaping ([Product]) -> ()) {
        productRepository.getAllProducts { products, error in
            guard error == nil else {
                print("An error occured")
                return
            }
            if let products = products {
                completionHandler(products)
            }
        }
    }

    public func getSampleProducts(completionHandler: @escaping ([Product]) -> ()) {
        productRepository.getSampleProducts { products, error in
            guard error == nil else {
                print("An error occured")
                return
            }
            if let products = products {
                completionHandler(products)
            }
        }
    }

    public func getProduct(id: Int, completionHandler: @escaping (Product?) -> ()) {
        productRepository.getProduct(id: id) { product, error in
            guard error == nil else {
                print("An error occured")
                return
            }
            completionHandler(product)
        }
    }

    public func getProducts(category: Category, completionHandler: @escaping ([Product]) -> ()) {
        productRepository.getProducts(categoryName: category.title) { products, error in
            guard error == nil else {
                print("An error occured")
                return
            }
            if let products = products {
                completionHandler(products)
            }
        }
    }
}
