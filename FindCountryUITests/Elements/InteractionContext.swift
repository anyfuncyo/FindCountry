//
//  InteractionContext.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 19/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import XCTest

protocol InteractionContext{}

extension InteractionContext{
    
    func onView(_ element: XCUIElement) {
        XCTAssert(element.waitForExistence(timeout: 10), "Element not founnd")
    }
    
    func type(text: String, into textField: XCUIElement){
        textField.tap()
        textField.typeText(text)
    }
    
    func tap(_ button: XCUIElement) {
        onView(button)
        button.tap()
    }
    
    func assertMatch(text: String, in element: XCUIElement){
        onView(element)
        XCTAssertTrue(element.label == text, "Text assertion fails")
    }
    
    func alertShows(_ alertID: String, closeAlert button: String){
        let alert = XCUIApplication().alerts[alertID]
        let button = alert.buttons[button]
        onView(alert)
        tap(button)
    }
    
}


