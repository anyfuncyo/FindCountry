//
//  ScreenIDs.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 19/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import XCTest

let app = XCUIApplication()

struct SearchScreen {
    let view =  app.otherElements["SearchScreen.view"]
    let textFields = app.textFields["SearchScreen.textField.input"]
    let button = app.buttons["SearchScreen.button.search"]
}

struct ResultScreen {
    let view = app.otherElements["ResultScreen.view"]
    let countryNameLabel = app.staticTexts["ResultScreen.label.countryName"]
    let capitalLabel = app.staticTexts["ResultScreen.label.capital"]
    let currencyLabel = app.staticTexts["ResultScreen.label.currency"]
}

struct Alert {
    let id: String
    let dismissButton: String
    
    init(id: String, dismissButton: String) {
        self.id = id
        self.dismissButton = dismissButton
        
    }
}
