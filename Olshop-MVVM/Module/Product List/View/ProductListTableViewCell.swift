//
//  ProductListTableViewCell.swift
//  Olshop-MVVM
//
//  Created by Phincon on 24/03/23.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    static let identifier = "ProductListTableViewCell"
    @IBOutlet weak var listView: UIView!{
        didSet{
            self.listView.layer.shadowColor = UIColor.black.cgColor
            self.listView.layer.shadowRadius = 5
            self.listView.backgroundColor = .white
            self.listView.layer.shadowOpacity = 0.2
            self.listView.layer.shadowOffset = .zero
            self.listView.layer.cornerRadius = 10
        }
    }
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
    
    func setData(products: Products){
        productNameLabel.text = products.title
        productPriceLabel.text = "$\(products.price)"
        ratingLabel.text = "\(products.rating.rate)/5"
        countRatingLabel.text = "\(products.rating.count) ulasan"
        productImage.sd_setImage(with: URL(string: products.image))
    }
}
