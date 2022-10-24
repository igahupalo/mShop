//
//  CartRepository.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import RealmSwift

protocol CartRepositoryProtocol {
    func addToCart(cartPosition: CartPosition)
    func getCartPositions() -> [CartPosition]
    func deleteCartPosition(productId: Int)
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
