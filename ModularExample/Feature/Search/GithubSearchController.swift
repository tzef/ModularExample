//
//  GithubSearchController.swift
//  ModularExample
//

import UIKit

final class GithubSearchController: NSObject {
    var searchStatus: HomepageViewModel.SearchStatus = .wait {
        didSet {
            switch searchStatus {
            case .wait:
                githubSearchResultController.statusTitle = "Please input the keyword"
            case .searching:
                githubSearchResultController.statusTitle = "Searching \(keyword)"
                searchController.searchBar.placeholder = keyword
            case .done:
                githubSearchResultController.statusTitle = "Latest search: \(keyword)"
                searchController.isActive = false
            case let .fail(message):
                githubSearchResultController.statusTitle = "Search Failed: \(message)"
            }
        }
    }

    var onKeywordSearched: Observer<String>?

    private(set) var keyword: String = "" {
        didSet {
            onKeywordSearched?(keyword)
        }
    }

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(
            searchResultsController: githubSearchResultController
        )
        searchController.showsSearchResultsController = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
        return searchController
    }()

    private lazy var githubSearchResultController: GithubSearchResultController = {
        let viewController = GithubSearchResultController()
        return viewController
    }()

    init(navigationItem: UINavigationItem) {
        super.init()
        // for fixing the bug related to UIRefreshControl and UISearchController
        // ref: https://developer.apple.com/forums/thread/118457
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = self.searchController
    }

    func defaultSearch() {
        keyword = "swift"
        searchStatus = .searching
    }
}

extension GithubSearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {}
}

extension GithubSearchController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        searchController.searchBar.text = searchController.searchBar.placeholder
    }

    func didPresentSearchController(_ searchController: UISearchController) {}

    func willDismissSearchController(_ searchController: UISearchController) {}

    func didDismissSearchController(_ searchController: UISearchController) {}
}

extension GithubSearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text, !keyword.isEmpty else {
            assertionFailure(
                "Search button click must have valid keyword string"
            )
            return
        }
        self.keyword = keyword
    }
}
