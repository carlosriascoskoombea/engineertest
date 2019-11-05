//
//  ViewController.swift
//  EngineerTest
//
//  Created by Carlos Riascos on 11/5/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet var limit: UITextField?
    @IBOutlet var offset: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func request() {
        guard let limit = limit?.text else { return }
        guard let offset = offset?.text else { return }
        let parameters: [String: String] = [
            "offset": offset,
            "limit": limit
        ]
        Alamofire.request("http://sd2-hiring.herokuapp.com/api/users", method: .get,
                          parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                guard let result = response.result.value as? [String: Any] else { return }
                guard let data = result["data"] as? [String: Any] else { return }
                guard let usersDic = data["users"] as?  Array<Any> else { return }
                let users = Mapper<User>().mapArray(JSONArray: usersDic as! [[String : Any]])
                guard let userListViewController = UIStoryboard.init(name: "Main",
                                                                     bundle: nil).instantiateViewController(identifier: "UserListViewController") as? UserListViewController else { return }
                userListViewController.users = users
                userListViewController.limit = limit
                userListViewController.offset = offset
                self.navigationController?.pushViewController(userListViewController, animated: true)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}

