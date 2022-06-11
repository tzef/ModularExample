//
//  GithubSearchResultController.swift
//  ModularSearch
//

import UIKit
import ModuleDesignSystem

final class GithubSearchResultController: UIViewController {
    var statusTitle: String? {
        didSet {
            titleLabel.text = statusTitle
        }
    }

    private lazy var titleLabel = DesignSystem.TitleLabel()

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
