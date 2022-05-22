//
//  RepositoryListRouter.swift
//  ModuleListing
//

import UIKit
import ModuleDetails
import ModuleCore

final class RepositoryListRouter {
    weak var viewController: UIViewController?

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        let detailsViewController = ModuleDetails.UIFactory.repositoryDetailsViewController(item: item)
        viewController?.show(detailsViewController, sender: nil)
    }
}
