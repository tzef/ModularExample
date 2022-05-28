//
//  RepositoryListSearchController.swift
//  ModuleListing
//

import UIKit

public protocol RepositoryListSearchController {
    var keyword: String { get }
    var onKeywordSearched: ((String) -> Void)? { get set }
    func setup(navigationItem: UINavigationItem)
    func defaultSearch()
    func searchStatusChanged(_ status: SearchStatus)
}
