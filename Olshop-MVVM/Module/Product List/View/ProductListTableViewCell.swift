//
//  ProductListTableViewCell.swift
//  Olshop-MVVM
//
//  Created by Phincon on 24/03/23.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    static let identifier = "ProductListTableViewCell"
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var countRatingLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
