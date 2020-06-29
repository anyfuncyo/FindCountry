//
//  AccessibilityIDs.swift
//  FindCountry
//
//  Created by Annie Guest on 19/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import Foundation

enum SearchScreen {
    static let view = "SearchScreen.view"
    
    enum textField {
        static let input = "SearchScreen.textField.input"
    }
    
    enum button {
        static let search = "SearchScreen.button.search"
    }
}

enum ResultScreen {
    static let view = "ResultScreen.view"
    
    enum label {
        static let countryName = "ResultScreen.label.countryName"
        static let capital = "ResultScreen.label.capital"
        static let currency = "ResultScreen.label.currency"
    }
}
