import Foundation
import UIKit

protocol DetailsViewInput: AnyObject {
    func wantUpdateImageView(image: UIImage?)
    func wantUpdateHeroName(name: String?)
    func wantUndoPath()
}
