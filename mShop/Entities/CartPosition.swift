//
//  ProductPosition.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import Foundation
import RealmSwift

class CartPosition: Object {
    @Persisted var quantity: Int
    @Persisted var productId: Int
    @Persisted var productTitle: String
    @Persisted var productUnitPrice: Double
    @Persisted var productCategory: String
    @Persisted var productDescription: String
    @Persisted var productImageUrl: String
    var formattedTotalPrice: String? {
        get {
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            return formatter.string(from: productUnitPrice * Double(quantity) as NSNumber)
        }
    }
    var formattedQuantity: String? {
        get {
            return("Qty: " + String(quantity))
        }
    }

    convenience init(product: Product, quantity: Int) {
        self.init()
        self.quantity = quantity
        self.productId = product.id
        self.productTitle = product.title
        self.productUnitPrice = product.price
        self.productCategory = product.category
        self.productDescription = product.description
        self.productImageUrl = product.imageUrl
    }
}
