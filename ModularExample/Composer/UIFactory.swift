//
//  UIFactory.swift
//  ModularExample
//

import ModuleListing

final class UIFactory {
    private init() {}

    static func repositoryListViewController() -> RepositoryListViewController {
        let delegate = RepositoryListRouterDelegate()
        let searchController = RepositoryListSearchController()
        return ModuleListing.UIFactory.repositoryListViewController(
            delegate: delegate,
            searchController: searchController
        )
    }
}
