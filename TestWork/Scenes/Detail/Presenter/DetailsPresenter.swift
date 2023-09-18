import Foundation
import Apollo
import RickMorty
import UIKit

class DetailsPresenter: DetailsViewOutput {
    weak var view: DetailsViewInput?

    func viewDidLoad() {
        fetchCharacter(withId: "1")
    }

    func undoButtonPressed() {
        view?.wantUndoPath()
    }

    func fetchCharacter(withId id: String) {
        let heroQuery = GetCharacterQuery(id: id)
        Network.shared.apollo.fetch(query: heroQuery) { [weak self] result in
            switch result {
            case .success(let result):
                if let character = result.data?.character {
                    self?.view?.wantUpdateHeroName(name: character.name)
                    if let stringURL = character.image, let url = URL(string: stringURL) {
                        self?.loadImageAsync(from: url) { [weak self] image in
                            self?.view?.wantUpdateImageView(image: image)
                        }
                    }
                } else if let errors = result.errors {
                    print("GraphQL Errors: \(errors)")
                }
            case .failure(let error):
                print("Network Error: \(error)")
            }
        }
    }
}

extension DetailsPresenter {
    func loadImageAsync(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in

            if let _ = error {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
