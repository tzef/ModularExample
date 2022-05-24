//
//  UIFactory.swift
//  ModuleListing
//

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController(
        delegate: RepositoryListRouterDelegate
    ) -> RepositoryListViewController {
        let githubSearchService = GithubSearchService()
        let viewModel = RepositoryListViewModel(
            githubSearchService: githubSearchService
        )
        let router = RepositoryListRouter(
            delegate: delegate
        )
        let viewController = RepositoryListViewController(
            router: router,
            viewModel: viewModel
        )
        router.viewController = viewController
        return viewController
    }
}
