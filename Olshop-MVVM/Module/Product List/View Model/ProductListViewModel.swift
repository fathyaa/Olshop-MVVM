//
//  ProductListViewModel.swift
//  Olshop-MVVM
//
//  Created by Phincon on 24/03/23.
//

import Foundation

protocol ProductListViewProtocol {
    var urlString: String { get }
    var bindProductsData: (([Products]?) -> ())? { get set }
    func fetchProductsData()
}

class ProductLisViewModel: ProductListViewProtocol {
    private var apiService: ApiServiceProtocol?
    var urlString: String
    var productsModel: [Products]?
    var bindProductsData: (([Products]?) -> ())?
    
    init(urlString: String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
        fetchProductsData()
    }
    
    func fetchProductsData() {
        self.apiService?.callApi(model: [Products].self, completion: { response in
            switch response {
            case .success(let success):
                self.bindProductsData?(success)
            case .failure(_):
                self.bindProductsData?(nil)
            }
        })
    }
}
