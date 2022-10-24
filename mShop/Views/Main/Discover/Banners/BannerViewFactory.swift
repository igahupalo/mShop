//
//  BannerViewFactory.swift
//  mShop
//
//  Created by Iga Hupalo on 28/04/2022.
//

import UIKit

class BannerViewFactory {
    weak var delegate: BannersTableViewCell?

    init(delegate: BannersTableViewCell) {
        self.delegate = delegate
    }

    func createBanners() -> [BannerView] {
        let banner1: BannerView = Bundle.main.loadNibNamed("Banner", owner: delegate)?.first as! BannerView
        banner1.setImage(image: UIImage(named: "banner_1") ?? UIImage())

        let banner2: BannerView = Bundle.main.loadNibNamed("Banner", owner: delegate)?.first as! BannerView
        banner2.setImage(image: UIImage(named: "banner_2") ?? UIImage())

        return [banner1, banner2]
    }
}
