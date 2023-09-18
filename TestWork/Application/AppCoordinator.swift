//
//  AppFlowCoordinator.swift
//  TestPavelVaskou
//
//  Created by Pavel Vaskou on 13.09.23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    func start()
}

final class AppCoordinator: CoordinatorProtocol {
    init(rootWindow: UIWindow?) {
        self.rootWindow = rootWindow
        let navigationController = UINavigationController()
        self.router = AppRouter(navigationController: navigationController)
        rootWindow?.rootViewController = navigationController
        rootWindow?.makeKeyAndVisible()
    }

    func start() {
        showMainScreen()
    }

    private let rootWindow: UIWindow?
    private(set) var router: AppRouter?
}
