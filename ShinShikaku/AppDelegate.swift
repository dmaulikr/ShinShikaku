//
//  AppDelegate.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/16/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        presentMainMenu()

        return true
    }


    func presentMainMenu() {
        let navController = UINavigationController(rootViewController: StartMenuViewController())
        navController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

