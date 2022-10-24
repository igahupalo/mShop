//
//  CartProductTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 01/05/2022.
//

import UIKit

protocol CartPositionTableViewCellDelegate: AnyObject {
    func updateCartPositionQuantity(cartPosition: CartPosition, quantity: Int)
    func deleteCartPosition(indexPath: IndexPath)
}

class CartPositionTableViewCell: UITableViewCell {
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!

    weak var delegate: CartPositionTableViewCellDelegate?
    var cartPosition: CartPosition?
    var indexPath: IndexPath?

    func setDelegate(delegate: CartPositionTableViewCellDelegate) {
        self.delegate = delegate
    }

    func setCartPosition(cartPosition: CartPosition) {
        self.cartPosition = cartPosition
        imageImageView.load(from: cartPosition.productImageUrl)
        titleLabel.text = cartPosition.productTitle
        quantityLabel.text = cartPosition.formattedQuantity
        totalPriceLabel.text = cartPosition.formattedTotalPrice
        stepper.value = Double(cartPosition.quantity)
    }

    func setIndexPath(indexPath: IndexPath) {
        self.indexPath = indexPath
    }

    @IBAction func didChangeStepperValue(_ sender: Any) {
        let value = stepper.value
        if let cartPosition = cartPosition {
            if value == 0, let indexPath = indexPath {
                self.delegate?.deleteCartPosition(indexPath: indexPath)
            } else {
                self.delegate?.updateCartPositionQuantity(cartPosition: cartPosition, quantity: Int(value))
                totalPriceLabel.text = cartPosition.formattedTotalPrice
                quantityLabel.text = cartPosition.formattedQuantity
            }
        }
    }
    @IBAction func didPressDeleteButton(_ sender: Any) {
        if let indexPath = indexPath {
            self.delegate?.deleteCartPosition(indexPath: indexPath)
        }
    }
}
