//
//  Product.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import Foundation
import UIKit

struct Product {
    var id: Int
    var title: String
    var price: Double
    var category: String
    var description: String
    var imageUrl: String
    var formattedPrice: String? {
        get {
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            return formatter.string(from: price as NSNumber)
        }
    }
}

extension Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case category
        case description
        case image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        price = try values.decode(Double.self, forKey: .price)
        category = try values.decode(String.self, forKey: .category)
        description = try values.decode(String.self, forKey: .description)
        imageUrl = try values.decode(String.self, forKey: .image)
    }
}
