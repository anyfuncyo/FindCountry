//
//  UITestSetUp.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 19/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import XCTest

class UITestSetUp: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments.append("--UItesting")
        MockServer.shared.start()
        app.launch()
        
        
    }
    
    override func tearDown() {
        MockServer.shared.stop()
        app.terminate()
    }
    
    
}
