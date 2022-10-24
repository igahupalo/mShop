//
//  BannersTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 28/04/2022.
//

import UIKit

class BannersTableViewCell: UITableViewCell {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    var banners: [BannerView] = [];

    override func layoutSubviews() {
        super.layoutSubviews()
        let bannerViewFactory = BannerViewFactory(delegate: self)
        banners = bannerViewFactory.createBanners()
        setupScrollView(banners: banners)

        pageControl.numberOfPages = banners.count
        pageControl.currentPage = 0
    }
}

private extension BannersTableViewCell {
    func setupScrollView(banners: [BannerView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        scrollView.contentSize = CGSize(width: contentView.frame.width * CGFloat(banners.count), height: contentView.frame.height)

        for i in 0 ..< banners.count {
            banners[i].frame = CGRect(x: contentView.frame.width * CGFloat(i), y: 0, width: contentView.frame.width, height: contentView.frame.height)
            scrollView.addSubview(banners[i])
        }

        contentView.subviews[0].bringSubviewToFront(pageControl)
    }
}


extension BannersTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / contentView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
