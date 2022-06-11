//
//  RepositoryListSearchController.swift
//  ModularExample
//

import UIKit
import ModuleUI
import ModuleSearch
import ModuleListing

final class RepositoryListSearchController: ModuleListing.RepositoryListSearchController {
    private let controller = ModuleSearch.UIFactory.searchController(
        designSystemFactory: ModuleUI.DesignSystemFactory()
    )

    var keyword: String {
        controller.keyword
    }

    var onKeywordSearched: Observer<String>? {
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
        controller.searchStatusChanged(status.searchControllerStatus)
    }
}
