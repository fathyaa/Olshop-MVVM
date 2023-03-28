//
//  TopProfileTableViewCell.swift
//  Olshop-MVVM
//
//  Created by Phincon on 28/03/23.
//

import UIKit

class TopProfileTableViewCell: UITableViewCell {

    static let identifier = "TopProfileTableViewCell"
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            profileImage.layer.cornerRadius = 90
        }
    }
    @IBOutlet weak var changePpButton: UIButton!{
        didSet{
            changePpButton.layer.cornerRadius = 25
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
