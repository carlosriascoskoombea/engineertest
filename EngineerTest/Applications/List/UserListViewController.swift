//
//  UserListViewController.swift
//  EngineerTest
//
//  Created by Carlos Riascos on 11/5/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    
    var users: [User]?
    var limit: String?
    var offset: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let userDetailsViewController = UIStoryboard.init(name: "Main",
        bundle: nil).instantiateViewController(identifier: "UserDetailsViewController") as? UserDetailsViewController else { return }
        let user = users?[indexPath.row]
        userDetailsViewController.limit = Int(limit ?? "0")
        userDetailsViewController.offset = Int(offset ?? "0")
        userDetailsViewController.user = user
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let user = users?[indexPath.row]
        cell.textLabel?.text = user?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = users?.count else { return 0 }
        return count
    }
}
