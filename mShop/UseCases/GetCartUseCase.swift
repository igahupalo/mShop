//
//  ObserveCartUseCase.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import Foundation

protocol GetCartUseCaseProtocol {
    func getCart() -> [CartPosition]
}

class GetCartUseCase: GetCartUseCaseProtocol {

    private var cartRepository: CartRepositoryProtocol

    init(cartRepository: CartRepositoryProtocol) {
        self.cartRepository = cartRepository
    }

    func getCart() -> [CartPosition] {
        return(cartRepository.getCartPositions())
    }
}
