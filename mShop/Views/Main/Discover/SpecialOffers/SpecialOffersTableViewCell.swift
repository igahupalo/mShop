//
//  SpecialOffersTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 28/04/2022.
//

import UIKit

protocol SpecialOffersTableViewCellDelegate: AnyObject {
    func didSelectProduct(productId: Int)
    var getProductsUseCase: GetProductsUseCaseProtocol { get }
}

class SpecialOffersTableViewCell: UITableViewCell {

    @IBOutlet weak var specialOffersCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var products: [Product] = []
    weak var delegate: SpecialOffersTableViewCellDelegate?

    func setDelegate(delegate: SpecialOffersTableViewCellDelegate) {
        self.delegate = delegate
        if let getProductsUseCase = self.delegate?.getProductsUseCase {
            getProductsUseCase.getSampleProducts { products in
                self.products = products
                self.activityIndicatorView.stopAnimating()
                self.specialOffersCollectionView.reloadData()
            }
        }
    }
}

extension SpecialOffersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverSalesCollectionViewCell.defaultIdentifier(), for: indexPath) as! DiscoverSalesCollectionViewCell

        cell.setProduct(products[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productId = products[indexPath.row].id
        delegate?.didSelectProduct(productId: productId)
    }
}
