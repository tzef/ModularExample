//
//  UIFactory.swift
//  ModuleListing
//

import UIKit

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController() -> RepositoryListViewController {
        let githubSearchService = GithubSearchService()
        let viewModel = RepositoryListViewModel(
            githubSearchService: githubSearchService
        )
        let router = RepositoryListRouter()
        let viewController = RepositoryListViewController(
            router: router,
            viewModel: viewModel
        )
        router.viewController = viewController
        return viewController
    }
}
