//
//  DiscoverCellFactory.swift
//  mShop
//
//  Created by Iga Hupalo on 28/04/2022.
//

import Foundation
import UIKit

class DiscoverCellFactory {
    private let tableView: UITableView
    private weak var specialOffersDelegate: SpecialOffersTableViewCellDelegate?

    init(tableView: UITableView, specialOffersDelegate: SpecialOffersTableViewCellDelegate) {
        self.tableView = tableView
        self.specialOffersDelegate = specialOffersDelegate
    }

    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case DiscoverRows.banners.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannersTableViewCell.defaultIdentifier()) as! BannersTableViewCell
            return cell
        case DiscoverRows.specialOffers.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: SpecialOffersTableViewCell.defaultIdentifier()) as! SpecialOffersTableViewCell
            if let specialOffersDelegate = specialOffersDelegate {
                cell.setDelegate(delegate: specialOffersDelegate)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

    func numberOfRows() -> Int {
        return DiscoverRows.numberOfCases()
    }
}

private enum DiscoverRows: Int {
    case banners, specialOffers

    static func allCases() -> [DiscoverRows] {
        [.banners, .specialOffers]
    }

    static func numberOfCases() -> Int {
        allCases().count
    }
}
