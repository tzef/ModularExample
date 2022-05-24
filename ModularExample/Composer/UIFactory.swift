//
//  UIFactory.swift
//  ModularExample
//

import ModuleListing

final class UIFactory {
    private init() {}

    static func repositoryListViewController() -> RepositoryListViewController {
        let delegate = RepositoryListRouterDelegate()
        return ModuleListing.UIFactory.repositoryListViewController(
            delegate: delegate
        )
    }
}
