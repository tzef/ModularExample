//
//  UIFactory.swift
//  ModularExample
//

import ModuleListing

final class UIFactory {
    private init() {}

    static func repositoryListViewController() -> RepositoryListViewController {
        ModuleListing.UIFactory.repositoryListViewController()
    }
}
