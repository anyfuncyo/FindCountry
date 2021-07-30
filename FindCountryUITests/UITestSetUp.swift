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
    
    func takeScreenshot(named name:String) {
        let fullScreenshot = XCUIScreen.main.screenshot()

        // Create a new attachment to save our screenshot and give it a name consisting of the "named" parameter and the device name, so we can find it later.
        let screenshotAttachment = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(UIDevice.current.name)-\(name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)

        // Usually Xcode will delete attachments after the test has run; we don't want that!
        screenshotAttachment.lifetime = .keepAlways

        // Add the attachment to the test log, so we can retrieve it later
        add(screenshotAttachment)
    }
    
    
}
