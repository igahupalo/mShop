//
//  ProductCategory.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import Foundation
import UIKit

struct Category {
    var title: String
    var image: UIImage {
        get {
            switch title {
            case "electronics":
                return UIImage(systemName: "headphones") ?? UIImage()
            case "men's clothing":
                return UIImage(systemName: "headphones") ?? UIImage()
            case "women's clothing":
                return UIImage(systemName: "headphones") ?? UIImage()
            case "jewelery":
                return UIImage(systemName: "headphones") ?? UIImage()
            default:
                return UIImage(systemName: "headphones") ?? UIImage()
            }
        }
    }
}
