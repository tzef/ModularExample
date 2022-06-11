//
//  SearchControllerService.swift
//  ModuleSearch
//

import UIKit

public protocol SearchControllerService {
    var keyword: String { get }
    var onKeywordSearched: ((String) -> Void)? { get set }
    func setup(navigationItem: UINavigationItem)
    func defaultSearch()
    func searchStatusChanged(_ status: SearchControllerStatus)
}
