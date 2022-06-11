//
//  RepositoryListRouter.swift
//  ModuleListing
//

import UIKit

public protocol RepositoryDetailsUIFactory {
    func repositoryDetailsViewController(
        with item: GithubSearchModel.Item
    ) -> UIViewController
}

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
