//
//  UIFactory.swift
//  ModularExample
//

import UIKit
import ModuleListing

final class UIFactory {
    private init() {}

    static func repositoryListViewController() -> RepositoryListViewController {
        ModuleListing.UIFactory.repositoryListViewController()
    }

    static func repositoryDetailsViewController(
        item: GithubSearchModel.Item
    ) -> RepositoryDetailsViewController {
        let viewModel = RepositoryDetailsViewModel(
            item: item
        )
        let viewController = RepositoryDetailsViewController(
            viewModel: viewModel
        )
        return viewController
    }
}
