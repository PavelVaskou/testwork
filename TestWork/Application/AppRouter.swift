//
//  Router.swift
//  TestWork
//
//  Created by Pavel Vaskou on 18.09.23.
//

import Foundation
import UIKit

class AppRouter {
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func setViewControllers(viewControllers: [UIViewController], animated: Bool) {
        navigationController?.setViewControllers(viewControllers, animated: animated)
    }

    func pushViewController(screen: UIViewController, animated: Bool) {
        navigationController?.pushViewController(screen, animated: animated)
    }

    private weak var navigationController: UINavigationController?
}

