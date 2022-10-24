//
//  CategoryTableViewCell.swift
//  mShop
//
//  Created by Iga Hupalo on 25/04/2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!

    var category: Category?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCategory(category: Category) {
        self.category = category
        titleLabel.text = category.title
    }

}
