//
//  ConfigModel.swift
//  FindCountry
//
//  Created by Annie Guest on 23/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import ObjectMapper

class ConfigModel: Mappable {
    
    var apiUrl: String?
    
    required init?(map: Map) {
        if map.JSON["api_url"] == nil {
            return nil
        }
    }
    
   func mapping(map: Map) {
        apiUrl <- map["api_url"]
    }
    
    
}
