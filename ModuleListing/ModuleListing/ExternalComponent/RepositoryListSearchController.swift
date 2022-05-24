//
//  RepositoryListSearchController.swift
//  ModuleListing
//

import UIKit
import ModuleCore

public protocol RepositoryListSearchController {
    var keyword: String { get }
    var onKeywordSearched: Observer<String>? { get set }
    func setup(navigationItem: UINavigationItem)
    func defaultSearch()
    func searchStatusChanged(_ status: SearchStatus)
}
