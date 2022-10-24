//
//  UpdateCartPositionQuantityUseCase.swift
//  mShop
//
//  Created by Iga Hupalo on 08/05/2022.
//

import Foundation

protocol UpdateCartPositionQuantityUseCaseProtocol {
    func updateCartPositionQuantity(productId: Int, quantity: Int)
}

class UpdateCartPositionQuantityUseCase: UpdateCartPositionQuantityUseCaseProtocol {

    private var cartRepository: CartRepositoryProtocol

    init(cartRepository: CartRepositoryProtocol) {
        self.cartRepository = cartRepository
    }

    func updateCartPositionQuantity(productId: Int, quantity: Int) {
        cartRepository.updateCartPositionQuantity(productId: productId, quantity: quantity)
    }
}
