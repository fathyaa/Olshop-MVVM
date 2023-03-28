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
    
    let storeImage: UIImageView = {
        let si = UIImageView()
        si.image = UIImage(named: "store")
        si.translatesAutoresizingMaskIntoConstraints = false
        return si
    }()
    
    let messageButton: UIImageView = {
        let mb = UIImageView()
        mb.image = UIImage(systemName: "envelope.fill")
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.tintColor = .black
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "nav")
        setupProductListTableView()
        bindAPIData()
        setupNavigation()
    }
    
    func setupProductListTableView(){
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: ProductListTableViewCell.identifier)
        listTableView.separatorStyle = .none
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
    
    func setupNavigation(){
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "nav")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: storeImage)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: messageButton)
        
        NSLayoutConstraint.activate([
            storeImage.heightAnchor.constraint(equalToConstant: 60),
            storeImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}
        
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.identifier, for: indexPath) as? ProductListTableViewCell else { return UITableViewCell()}
        if let products = modelProducts?[indexPath.row] {
            cell.setData(products: products)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as! ProductDetailViewController
        if let product = modelProducts?[indexPath.row] {
            detailVC.dataProduct = product
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
