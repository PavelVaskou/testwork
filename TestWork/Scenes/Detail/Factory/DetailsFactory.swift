import Foundation

class DetailsFactory {
    static func screen() -> DetailsViewController {
        let viewController = DetailsViewController()
        let presenter = DetailsPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}