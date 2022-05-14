//
//  RepositoryListRouter.swift
//  ModularExample
//

import UIKit

final class RepositoryListRouter {
    weak var viewController: UIViewController?

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        let detailsViewController = UIFactory.repositoryDetailsViewController(item: item)
        viewController?.show(detailsViewController, sender: nil)
    }
}
