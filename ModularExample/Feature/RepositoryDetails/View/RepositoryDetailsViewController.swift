//
//  RepositoryDetailsViewController.swift
//  ModularExample
//

import UIKit

final class RepositoryDetailsViewController: UIViewController {
    private let viewModel: RepositoryDetailsViewModel

    init(viewModel: RepositoryDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = viewModel.title
        view.backgroundColor = UIColor.systemBackground
    }
}
