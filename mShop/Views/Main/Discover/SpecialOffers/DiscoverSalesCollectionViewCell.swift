//
//  DiscoverSalesCollectionViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 21/04/2022.
//

import UIKit

class DiscoverSalesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    var product: Product?

    func setProduct(_ product: Product) {
        self.product = product
        title.text = product.title
        price.text = product.formattedPrice
        image.load(from: product.imageUrl)
    }
}
