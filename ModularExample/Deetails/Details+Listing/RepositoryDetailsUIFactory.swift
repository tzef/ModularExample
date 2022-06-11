//
//  RepositoryDetailsUIFactory.swift
//  ModularExample
//

import UIKit
import ModuleUI
import ModuleDetails
import ModuleListing

final class RepositoryDetailsUIFactory: ModuleListing.RepositoryDetailsUIFactory {
    private let itemMapper: DetailsSearchItemMapper

    init(itemMapper: DetailsSearchItemMapper) {
        self.itemMapper = itemMapper
    }

    func repositoryDetailsViewController(
        with item: GithubSearchModel.Item
    ) -> UIViewController {
        ModuleDetails.UIFactory.repositoryDetailsViewController(
            item: itemMapper.toDetailsSearchItemModel(from: item),
            designSystemFactory: ModuleUI.DesignSystemFactory()
        )
    }
}
