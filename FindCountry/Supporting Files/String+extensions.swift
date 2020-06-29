//
//  String+extensions.swift
//  FindCountry
//
//  Created by Annie Guest on 18/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Foundation

extension String {
    func trimmed()-> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "%20")
    }
}
