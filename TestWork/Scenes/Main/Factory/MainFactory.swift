import Foundation

class MainFactory {
    static func screen() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}