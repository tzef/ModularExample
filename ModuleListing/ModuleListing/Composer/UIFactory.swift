//
//  UIFactory.swift
//  ModuleListing
//

import ModuleDesignSystem

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController(
        delegate: RepositoryListRouterDelegate,
        githubSearchService: GithubSearchService,
        searchController: RepositoryListSearchController,
        designSystemFactory: DesignSystemFactory
    ) -> RepositoryListViewController {
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
        DesignSystem.setup(factory: designSystemFactory)
        return viewController
    }
}
