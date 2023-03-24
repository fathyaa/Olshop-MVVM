//
//  ProductListViewController.swift
//  Olshop-MVVM
//
//  Created by Phincon on 24/03/23.
//

import UIKit
import SDWebImage

class ProductListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    var listViewModel: ProductLisViewModel?
    var modelProducts: [Products]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product List"
        setupProductListTableView()
        bindAPIData()
    }
    
    func setupProductListTableView(){
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: ProductListTableViewCell.identifier)
    }
    
    func bindAPIData(){
        self.listViewModel = ProductLisViewModel(urlString: "https://fakestoreapi.com/products", apiService: ApiService())
        self.listViewModel?.bindProductsData = { productsModel in
            if let model = productsModel{
                self.modelProducts = model
            } else {
                self.listTableView.backgroundColor = .gray
            }
            print("reload data")
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
    }
}
        
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.identifier, for: indexPath) as? ProductListTableViewCell else { return UITableViewCell()}
        if let products = modelProducts?[indexPath.row] {
            cell.productNameLabel.text = products.title
            cell.productPriceLabel.text = "$\(products.price)"
            cell.ratingLabel.text = "\(products.rating.rate)/5"
            cell.countRatingLabel.text = "\(products.rating.count) ulasan"
            cell.productImage.sd_setImage(with: URL(string: products.image))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as! ProductDetailViewController
        detailVC.dataProduct = modelProducts
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
