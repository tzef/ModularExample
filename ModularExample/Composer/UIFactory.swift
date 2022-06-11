//
//  UIFactory.swift
//  ModularExample
//

import ModuleUI
import ModuleListing

final class UIFactory {
    private init() {}

    static func repositoryListViewController() -> RepositoryListViewController {
        let apiService = RepositoryListAPIService()
        let delegate = RepositoryListRouterDelegate()
        let searchController = RepositoryListSearchController()
        return ModuleListing.UIFactory.repositoryListViewController(
            delegate: delegate,
            apiService: apiService,
            searchController: searchController,
            designSystemFactory: ModuleUI.DesignSystemFactory()
        )
    }
}
