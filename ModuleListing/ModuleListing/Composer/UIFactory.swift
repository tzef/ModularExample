//
//  UIFactory.swift
//  ModuleListing
//

import ModuleDesignSystem

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController(
        uiFactory: RepositoryDetailsUIFactory,
        apiService: APIService,
        searchController: RepositoryListSearchController,
        designSystemFactory: DesignSystemFactory
    ) -> RepositoryListViewController {
        let searchService = GithubSearchRepository(apiService: apiService)
        let viewModel = RepositoryListViewModel(
            githubSearchService: searchService
        )
        let router = RepositoryListRouter(
            uiFactory: uiFactory
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
