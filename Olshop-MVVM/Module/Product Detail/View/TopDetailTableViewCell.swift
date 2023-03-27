//
//  TopDetailTableViewCell.swift
//  Olshop-MVVM
//
//  Created by Phincon on 27/03/23.
//

import UIKit

class TopDetailTableViewCell: UITableViewCell {

    static let identifier = "TopDetailTableViewCell"
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageShadowView: UIView!{
        didSet{
            imageShadowView.layer.shadowColor = UIColor.black.cgColor
            imageShadowView.layer.shadowRadius = 5
            imageShadowView.layer.shadowOpacity = 0.2
            imageShadowView.layer.shadowOffset = .zero
            imageShadowView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageFrameView: UIView!{
        didSet{
            imageFrameView.layer.masksToBounds = true
            imageFrameView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(product: Products){
        titleLabel.text = product.title
        priceLabel.text = "$\(product.price)"
        detailImage.sd_setImage(with: URL(string: product.image))
        captionLabel.text = product.title
    }
}
