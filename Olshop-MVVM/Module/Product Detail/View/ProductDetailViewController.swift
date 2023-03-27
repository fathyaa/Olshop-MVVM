//
//  ProductDetailViewController.swift
//  Olshop-MVVM
//
//  Created by Phincon on 24/03/23.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    var dataProduct: Products?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "nav")
        setupDetailTableView()
    }
    
    func setupDetailTableView(){
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: "TopDetailTableViewCell", bundle: nil), forCellReuseIdentifier: TopDetailTableViewCell.identifier)
        detailTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailTableView.separatorStyle = .none
    }
    
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: TopDetailTableViewCell.identifier, for: indexPath) as? TopDetailTableViewCell else { return UITableViewCell() }
            if let data = dataProduct {
                cell.setData(product: data)
            }
            return cell
            
        } else {
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            
            cell.descLabel.text = dataProduct?.description
            cell.categoryLabel.text = dataProduct?.category
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UITableViewHeaderFooterView()
        
            let sectionTitleLabel = UILabel()
            sectionTitleLabel.text = "Product Detail"
            sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false

            let separator = UIView()
            separator.backgroundColor = UIColor.lightGray
            separator.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(separator)
            headerView.addSubview(sectionTitleLabel)
            
            NSLayoutConstraint.activate([
                separator.heightAnchor.constraint(equalToConstant: 1),
                separator.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20),
                separator.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -20),
                separator.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
                separator.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 10),
                sectionTitleLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20)
            ])
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, selectionFollowsFocusForRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
