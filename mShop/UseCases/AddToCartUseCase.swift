//
//  AddToCartUseCase.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import Foundation

protocol AddToCartUseCaseProtocol {
    func addToCart(product: Product, quantity: Int)
}

extension AddToCartUseCaseProtocol {
    func addToCart(product: Product, quantity: Int = 1) {
        return addToCart(product: product, quantity: quantity)
    }
}

class AddToCartUseCase: AddToCartUseCaseProtocol {

    private var cartRepository: CartRepositoryProtocol

    init(cartRepository: CartRepositoryProtocol) {
        self.cartRepository = cartRepository
    }

    func addToCart(product: Product, quantity: Int = 1) {
        let cartPosition = CartPosition(product: product, quantity: quantity)

        cartRepository.addToCart(cartPosition: cartPosition)
    }
}
