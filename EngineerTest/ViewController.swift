//
//  ViewController.swift
//  EngineerTest
//
//  Created by Carlos Riascos on 11/5/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit
import Alamofire

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
        Alamofire.request("http://sd2-hiring.herokuapp.com/api/users", method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
        }
    }
    
}

