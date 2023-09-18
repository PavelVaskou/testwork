//
//  AppDelegate.swift
//  TestWork
//
//  Created by Pavel Vaskou on 15.09.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appFlowCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        handleAppWasConfigured()
        return true
    }

    func handleAppWasConfigured() {
        appFlowCoordinator = AppCoordinator(rootWindow: window)
        appFlowCoordinator?.start()
    }
}

