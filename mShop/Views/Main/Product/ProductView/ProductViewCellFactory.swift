//
//  ProductViewTableViewCells.swift
//  mShop
//
//  Created by Iga Hupalo on 26/04/2022.
//

import Foundation
import UIKit

class ProductViewCellFactory {
    private let tableView: UITableView
    private let product: Product
    weak private var productActionsDelegate: ProductActionsDelegate?
    weak private var productVideoDelegate: ProductVideoDelegate?

    init(tableView: UITableView, product: Product, productActionsDelegate: ProductActionsDelegate, productVideoDelegate: ProductVideoDelegate) {
        self.tableView = tableView
        self.product = product
        self.productActionsDelegate = productActionsDelegate
        self.productVideoDelegate = productVideoDelegate
    }

    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case ProductViewRows.image.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductImageTableViewCell.defaultIdentifier()) as! ProductImageTableViewCell
            cell.setImage(imageUrl: product.imageUrl)
            return cell
        case ProductViewRows.title.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTitleTableViewCell.defaultIdentifier()) as! ProductTitleTableViewCell
            cell.setTitle(title: product.title)
            return cell
        case ProductViewRows.price.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductPriceTableViewCell.defaultIdentifier()) as! ProductPriceTableViewCell
            cell.setPrice(price: product.formattedPrice ?? "")
            return cell
        case ProductViewRows.actions.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductActionsTableViewCell.defaultIdentifier()) as! ProductActionsTableViewCell
            if let productActionsDelegate = productActionsDelegate {
                cell.setDelegate(delegate: productActionsDelegate)
            }
            return cell
        case ProductViewRows.description.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductDescriptionTableViewCell.defaultIdentifier()) as! ProductDescriptionTableViewCell
            cell.setDescription(description: product.description)
            return cell
        case ProductViewRows.video.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductVideoTableViewCell.defaultIdentifier()) as! ProductVideoTableViewCell
            if let productVideoDelegate = productVideoDelegate {
                cell.setDelegate(delegate: productVideoDelegate)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

    func numberOfRows() -> Int {
        return ProductViewRows.numberOfCases()
    }
}

private enum ProductViewRows: Int {
    case image, title, price, actions, description, video

    static func allCases() -> [ProductViewRows] {
        [.image, .title, .price, .actions, .description, .video]
    }

    static func numberOfCases() -> Int {
        allCases().count
    }
}


class ProductImageTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    func setImage(imageUrl: String) {
        mainImageView.load(from: imageUrl)
    }
}

class ProductTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    func setTitle(title: String) {
        titleLabel.text = title
    }
}

class ProductPriceTableViewCell: UITableViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    func setPrice(price: String) {
        priceLabel.text = price
    }
}

class ProductDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    func setDescription(description: String) {
        descriptionLabel.text = description
    }
}
