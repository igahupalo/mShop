//
//  BannerView.swift
//  mShop
//
//  Created by Iga Hupalo on 28/04/2022.
//

import UIKit

class BannerView: UIView {
    @IBOutlet weak var contentImageView: UIImageView!

    func setImage(image: UIImage) {
        contentImageView.image = image
    }
}
