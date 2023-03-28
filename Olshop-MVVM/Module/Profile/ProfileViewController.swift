//
//  ProfileViewController.swift
//  Olshop-MVVM
//
//  Created by Phincon on 28/03/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileTableView()
    }
    
    func setupProfileTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UINib(nibName: "TopProfileTableViewCell", bundle: nil), forCellReuseIdentifier: TopProfileTableViewCell.identifier)
        profileTableView.register(UINib(nibName: "ProfileMenuTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileMenuTableViewCell.identifier)
        profileTableView.separatorStyle = .none
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = profileTableView.dequeueReusableCell(withIdentifier: TopProfileTableViewCell.identifier, for: indexPath) as? TopProfileTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = profileTableView.dequeueReusableCell(withIdentifier: ProfileMenuTableViewCell.identifier, for: indexPath) as? ProfileMenuTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
