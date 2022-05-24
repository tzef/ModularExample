//
//  RepositoryListRouterDelegate.swift
//  ModularExample
//

import UIKit
import ModuleListing
import ModuleDetails

final class RepositoryListRouterDelegate: ModuleListing.RepositoryListRouterDelegate {
    func showRepositoryDetailsPage(
        with item: GithubSearchModel.Item,
        from viewController: UIViewController?
    ) {
        let detailsViewController = ModuleDetails.UIFactory.repositoryDetailsViewController(
            item: item.detailsSearchItemModel
        )
        viewController?.show(detailsViewController, sender: nil)
    }
}
