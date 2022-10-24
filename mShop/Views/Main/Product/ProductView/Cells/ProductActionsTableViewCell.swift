//
//  ProductActionsTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 02/05/2022.
//

import UIKit

protocol ProductActionsDelegate: AnyObject {
    func didSelectAddToCartButton()
}

class ProductActionsTableViewCell: UITableViewCell {
    weak var delegate: ProductActionsDelegate?

    func setDelegate(delegate: ProductActionsDelegate) {
        self.delegate = delegate
    }

    @IBAction func didSelectAddToCartButton(_ sender: Any) {
        if let delegate = delegate {
            delegate.didSelectAddToCartButton()
        }
    }
}
