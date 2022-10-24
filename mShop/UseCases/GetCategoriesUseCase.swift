//
//  GetCategoriesUseCase.swift
//  mShop
//
//  Created by Iga Hupalo on 25/04/2022.
//

import Foundation

protocol GetCategoriesUseCaseProtocol {
    func getAllCategories(completionHandler: @escaping ([Category]) -> ())
}

class GetCategoriesUseCase: GetCategoriesUseCaseProtocol {

    private var categoryRepository: CategoryRepositoryProtocol

    init(categoryRepository: CategoryRepositoryProtocol) {
        self.categoryRepository = categoryRepository
    }

    public func getAllCategories(completionHandler: @escaping ([Category]) -> ()) {
        categoryRepository.getAllCategories { categories, error in
            guard error == nil else {
                print("An error occured")
                return
            }
            if let categories = categories {
                completionHandler(categories)
            }
        }
    }
}
