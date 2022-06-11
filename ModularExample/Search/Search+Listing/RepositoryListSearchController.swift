//
//  RepositoryListSearchController.swift
//  ModularExample
//

import UIKit
import ModuleUI
import ModuleSearch
import ModuleListing

final class RepositoryListSearchController: ModuleListing.RepositoryListSearchController {
    private var controller = ModuleSearch.UIFactory.searchController(
        designSystemFactory: ModuleUI.DesignSystemFactory()
    )

    private let statusMapper: SearchControllerStatusMapper

    init(statusMapper: SearchControllerStatusMapper) {
        self.statusMapper = statusMapper
    }

    var keyword: String {
        controller.keyword
    }

    var onKeywordSearched: ((String) -> Void)? {
        didSet {
            controller.onKeywordSearched = onKeywordSearched
        }
    }

    func setup(navigationItem: UINavigationItem) {
        controller.setup(navigationItem: navigationItem)
    }


    func defaultSearch() {
        controller.defaultSearch()
    }

    func searchStatusChanged(_ status: SearchStatus) {
        controller.searchStatusChanged(statusMapper.toSearchControllerStatus(from: status))
    }
}
