//
//  AppDelegate.swift
//  FindCountry
//
//  Created by Annie Guest on 10/06/2020.
//  Copyright © 2020 Anyfuncy. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppLaunchManager.setUp()
        return true
    }

}

