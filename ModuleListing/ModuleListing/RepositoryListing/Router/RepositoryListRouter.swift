//
//  RepositoryListRouter.swift
//  ModuleListing
//

import UIKit
import ModuleDetails

final class RepositoryListRouter {
    weak var viewController: UIViewController?

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        let detailsViewController = ModuleDetails.UIFactory.repositoryDetailsViewController(item: item.modelForModuleDetails)
        viewController?.show(detailsViewController, sender: nil)
    }
}
