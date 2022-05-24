//
//  RepositoryListRouter.swift
//  ModuleListing
//

import UIKit

public protocol RepositoryListRouterDelegate {
    func showRepositoryDetailsPage(
        with item: GithubSearchModel.Item,
        from viewController: UIViewController?
    )
}

final class RepositoryListRouter {
    weak var viewController: UIViewController?

    var delegate: RepositoryListRouterDelegate

    init(delegate: RepositoryListRouterDelegate) {
        self.delegate = delegate
    }

    func showRepositoryDetailsPage(with item: GithubSearchModel.Item) {
        delegate.showRepositoryDetailsPage(with: item, from: viewController)
    }
}
