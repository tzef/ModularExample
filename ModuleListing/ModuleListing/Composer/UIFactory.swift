//
//  UIFactory.swift
//  ModuleListing
//

import UIKit
import ModuleDesignSystem

public final class UIFactory {
    private init() {}

    public static func repositoryListViewController(
        uiFactory: RepositoryDetailsUIFactory,
        apiService: APIService,
        searchController: RepositoryListSearchController,
        designSystemFactory: DesignSystemFactory
    ) -> UIViewController {
        let responseMapper = GithubSearchAPIResponseMapper()
        let searchService = GithubSearchRepository(
            apiService: apiService,
            responseMapper: responseMapper
        )        
        let itemMapper = GithubSearchModelItemMapper()
        let searchStatus = ListingSearchStatusMapper()
        let viewModel = RepositoryListViewModel(
            githubSearchService: searchService,
            itemMapper: itemMapper,
            searchStatusMapper: searchStatus
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
