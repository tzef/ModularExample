//
//  RepositoryListRouter.swift
//  ModuleListing
//

import UIKit

final class RepositoryListRouter {
    weak var viewController: UIViewController?

    var uiFactory: RepositoryDetailsUIFactory

    init(uiFactory: RepositoryDetailsUIFactory) {
        self.uiFactory = uiFactory
    }

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        let detailsPage = uiFactory.repositoryDetailsViewController(
            with: item
        )
        viewController?.show(detailsPage, sender: nil)
    }
}
