//
//  RepositoryDetailsUIFactory.swift
//  ModularExample
//

import UIKit
import ModuleUI
import ModuleDetails
import ModuleListing

final class RepositoryDetailsUIFactory: ModuleListing.RepositoryDetailsUIFactory {
    func repositoryDetailsViewController(
        with item: GithubSearchModel.Item
    ) -> UIViewController {
        ModuleDetails.UIFactory.repositoryDetailsViewController(
            item: item.detailsSearchItemModel,
            designSystemFactory: ModuleUI.DesignSystemFactory()
        )
    }
}
