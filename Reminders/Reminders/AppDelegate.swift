//
//  AppDelegate.swift
//  Reminders
//
//  Created by Amanda Detofol on 13/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }

    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

}

