import Foundation
import UIKit
import SnapKit
import Apollo


class DetailsViewController: UIViewController {

    //MARK:- Constants
    enum Constants {

    }

    //MARK:- MVP
    var presenter: DetailsPresenter?

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutViews()
        view.layoutIfNeeded()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        undoButton.layer.cornerRadius = 12
        undoButton.clipsToBounds = true
    }

    // MARK: - Private
    private func layoutViews() {
        view.addSubview(drawingView)
        view.addSubview(undoButton)

        drawingView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(drawingView.snp.width)
        }

        undoButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
    }

    private func setupView() {
        title = "Details"
        view.backgroundColor = .white.withAlphaComponent(0.9)
        drawingView.backgroundColor = .white.withAlphaComponent(0.8)
        undoButton.addTarget(self, action: #selector(undoButtonTapped), for: .touchUpInside)
    }

    @objc func undoButtonTapped() {
        presenter?.undoButtonPressed()
    }

    private var drawingView = DrawingView()

    private lazy var undoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Undo", for: .normal)
        button.addTarget(self, action: #selector(undoButtonTapped), for: .touchUpInside)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
}

//MARK:- DetailsViewInput
extension DetailsViewController: DetailsViewInput {
    func wantUpdateImageView(image: UIImage?) {
        drawingView.setImage(image: image)
    }

    func wantUpdateHeroName(name: String?) {
        if let name {
            title = name
        }
    }

    func wantUndoPath() {
        drawingView.undo()
    }
}




