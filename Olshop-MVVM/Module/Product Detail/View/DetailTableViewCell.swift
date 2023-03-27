//
//  DetailTableViewCell.swift
//  Olshop-MVVM
//
//  Created by Phincon on 27/03/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    static let identifier = "DetailTableViewCell"
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
