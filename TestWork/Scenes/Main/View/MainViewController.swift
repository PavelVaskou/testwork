import Foundation
import UIKit
import SnapKit

class MainViewController: UIViewController {
    var presenter: MainPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutViews()
        view.layoutIfNeeded()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        actionButton.layer.cornerRadius = 12
        actionButton.clipsToBounds = true
    }

    private func setupView() {
        view.backgroundColor = .white.withAlphaComponent(0.9)
        title = "Main"
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }

    private func layoutViews() {
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.6)
        }
    }

    @objc func actionButtonTapped() {
        presenter?.actionButtonPressed()
    }

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
}

//MARK:- MainViewInput
extension MainViewController: MainViewInput {

}
