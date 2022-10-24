//
//  productTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 25/04/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setProduct(_ product: Product) {
        imageImageView.load(from: product.imageUrl)
        titleLabel.text = product.title
        priceLabel.text = product.formattedPrice
    }

}
