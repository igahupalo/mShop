//
//  ProductVideoTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 09/05/2022.
//

import UIKit

protocol ProductVideoDelegate: AnyObject {
    func playVideo()
}

class ProductVideoTableViewCell: UITableViewCell {

    weak var delegate: ProductVideoDelegate?

    func setDelegate(delegate: ProductVideoDelegate) {
        self.delegate = delegate
    }

    @IBAction func didPressPlayButton(_ sender: Any) {
        delegate?.playVideo()
    }
}
