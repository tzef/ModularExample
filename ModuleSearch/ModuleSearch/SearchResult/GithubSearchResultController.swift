//
//  GithubSearchResultController.swift
//  ModularSearch
//

import UIKit

final class GithubSearchResultController: UIViewController {
    var statusTitle: String? {
        didSet {
            titleLabel.text = statusTitle
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        setupView()
    }

    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
