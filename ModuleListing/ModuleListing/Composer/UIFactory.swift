//
//  UIFactory.swift
//  ModuleListing
//

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController(
        delegate: RepositoryListRouterDelegate,
        searchController: RepositoryListSearchController
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
            viewModel: viewModel,
            searchController: searchController
        )
        router.viewController = viewController
        return viewController
    }
}
