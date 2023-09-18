import Foundation
import UIKit

class MainPresenter: MainViewOutput {
    weak var view: MainViewInput!
    var showDetailsScreen: (()-> Void)?

    func actionButtonPressed() {
        showDetailsScreen?()
    }
}
