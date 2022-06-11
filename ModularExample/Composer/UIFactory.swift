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
        let uiFactory = RepositoryDetailsUIFactory()
        let statusMapper = ListingSearchStatusMapper()
        let searchController = RepositoryListSearchController(
            statusMapper: statusMapper
        )
        return ModuleListing.UIFactory.repositoryListViewController(
            uiFactory: uiFactory,
            apiService: apiService,
            searchController: searchController,
            designSystemFactory: ModuleUI.DesignSystemFactory()
        )
    }
}
