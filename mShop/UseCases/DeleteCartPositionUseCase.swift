//
//  DeleteCartPositionUseCase.swift
//  mShop
//
//  Created by Iga Hupalo on 08/05/2022.
//

import Foundation

protocol DeleteCartPositionUseCaseProtocol {
    func deleteCartPosition(productId: Int)
}

class DeleteCartPositionUseCase: DeleteCartPositionUseCaseProtocol {

    private var cartRepository: CartRepositoryProtocol

    init(cartRepository: CartRepositoryProtocol) {
        self.cartRepository = cartRepository
    }

    func deleteCartPosition(productId: Int) {
        cartRepository.deleteCartPosition(productId: productId)
    }
}
