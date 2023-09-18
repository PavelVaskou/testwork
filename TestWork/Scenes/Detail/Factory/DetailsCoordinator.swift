import Foundation
import UIKit

extension AppCoordinator {
    func showDetailsScreen() {
        let screen = DetailsFactory.screen()
        router?.pushViewController(screen: screen, animated: true)
    }
}
