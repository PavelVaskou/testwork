import Foundation
import UIKit

extension AppCoordinator {
    func showMainScreen() {
        let screen = MainFactory.screen()

        screen.presenter?.showDetailsScreen = { [weak self] in
            self?.showDetailsScreen()
        }

        router?.pushViewController(screen: screen, animated: true)
    }
}
