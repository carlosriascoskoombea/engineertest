//
//  User.swift
//  EngineerTest
//
//  Created by Carlos Riascos on 11/5/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import Foundation
import ObjectMapper

class Model: Mappable {
    
    var name: String?
    var image: String?
    var items: [String]?

    //MARK: - Mappable
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        image <- map["image"]
        items <- map["items"]
    }
    
}
