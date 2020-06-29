//
//  AppLaunchManager.swift
//  FindCountryUITests
//
//  Created by Annie Guest on 22/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import UIKit

struct AppLaunchManager {
    
    static func setUp(){
        #if DEBUG && targetEnvironment(simulator)
        print("Running on debug and simulator")
        configureForUITesting()
        #elseif RELEASE
        print("Running on release")
        #endif
    }
    
    #if DEBUG && targetEnvironment(simulator)
    
    private static func configureForUITesting(){
        guard CommandLine.arguments.contains("--UItesting") else { return }
        disableHardwareKeyboard()
        
    }
    
    private static func disableHardwareKeyboard() {
        let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
        UITextInputMode.activeInputModes
            .filter { $0.responds(to: setHardwareLayout) }
            .forEach { $0.perform(setHardwareLayout, with: nil) }
    }
    #endif
    
}

