//
//  TabBarViewController.swift
//  Olshop-MVVM
//
//  Created by Phincon on 28/03/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }

    private func setupVC(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productListVC = storyboard.instantiateViewController(withIdentifier: "productListVC")
        let profileVC = storyboard.instantiateViewController(withIdentifier: "profileVC")
        
        viewControllers = [
            createController(rootVC: productListVC, title: "Product List", image: UIImage(systemName: "house")),
            createController(rootVC: profileVC, title: "Profile", image: UIImage(systemName: "person"))
        ]
    }
    
    private func createController(rootVC: UIViewController,
                                  title: String,
                                  image: UIImage?) -> UIViewController {
        let vc = UINavigationController(rootViewController: rootVC)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
}
