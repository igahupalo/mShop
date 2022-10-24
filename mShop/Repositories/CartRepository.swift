//
//  CartRepository.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import RealmSwift

protocol CartRepositoryProtocol {

    // Adds product to cart. If such a product already exists in the cart, number of items is incremented. Otherwise a new position is added.
    // - Parameters: CartPosition struct
    // - Returns: void
    func addToCart(cartPosition: CartPosition)

    // Returns list of positions added to cart stored in local database.
    // - Parameters: none
    // - Returns: array of CartPosition structs
    func getCartPositions() -> [CartPosition]

    // Removes from cart position of product with given id.
    // - Parameters: product id
    // - Returns: void
    func deleteCartPosition(productId: Int)

    // Updates quantity of specific product with given id stored in database. If quantity is equal zero, the product is delated.
    // - Parameters: product id and new quantity
    // - Returns: void
    func updateCartPositionQuantity(productId: Int, quantity: Int)
}

class CartRepository: CartRepositoryProtocol {
    let realm = try! Realm(configuration: DatabaseConfig.config)

    func addToCart(cartPosition: CartPosition) {
        let positions = realm.objects(CartPosition.self).filter("productId == %@", cartPosition.productId)
        try! realm.write {
            if let position = positions.first {
                position.quantity = position.quantity + 1
            } else {
                realm.add(cartPosition)
            }
        }

    }

    func getCartPositions() -> [CartPosition] {
        let objects = realm.objects(CartPosition.self)
        return objects.reversed()
    }

    func updateCartPositionQuantity(productId: Int, quantity: Int) {
        let positions = realm.objects(CartPosition.self).filter("productId == %@", productId)
        if let position = positions.first {
            try! realm.write {
                if quantity == 0 {
                    realm.delete(position)
                } else {
                    position.quantity = quantity
                }
            }
        }
    }

    func deleteCartPosition(productId: Int) {
        let positions = realm.objects(CartPosition.self).filter("productId == %@", productId)
        if let position = positions.first {
            try! realm.write {
                realm.delete(position)
            }
        }
    }
}
