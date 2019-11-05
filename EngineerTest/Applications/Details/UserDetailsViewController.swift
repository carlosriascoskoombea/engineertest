//
//  UserDetailsViewController.swift
//  EngineerTest
//
//  Created by Carlos Riascos on 11/5/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet var userName: UILabel? 
    @IBOutlet var userImage: UIImageView?
    var user: User?
    var limit: Int? = 0
    var offset: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
