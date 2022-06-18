//
//  RepositoryDetailsUIFactory.swift
//  ModuleListing
//

import UIKit

public protocol RepositoryDetailsUIFactory {
    func repositoryDetailsViewController(
        with item: ListingItemDisplaying
    ) -> UIViewController
}

