//
//  RepositoryListViewModel.swift
//  ModuleListing
//

import ModuleUI

final class RepositoryListViewModel {
    var onSearchLoaded: Observer<GithubSearchModel?>?
    var onSearchStatusChangedObservers = [Observer<SearchStatus>]()
    var onRefreshStatusChangedObserver: Observer<RefreshControllerStatus>?

    private let githubSearchService: GithubSearchService
    private var searchResults: GithubSearchModel? {
        didSet {
            onSearchLoaded?(searchResults)
        }
    }
    private var keyword: String?
    private var page: Int {
        guard let totalCount = searchResults?.items.count else {
            return 0
        }
        return totalCount / GithubResource.perPage
    }

    private(set) var status = SearchStatus.wait {
        didSet {
            onSearchStatusChangedObservers.forEach {
                $0(status)
            }
            onRefreshStatusChangedObserver?(status.refreshStatus)
        }
    }

    var title: String {
        "GitHub Repository Search"
    }

    var hasNextPage: Bool {
        guard
            let total = searchResults?.total,
            let loadedCount = searchResults?.items.count
        else {
            return false
        }
        return total > loadedCount
    }

    var numberOfRows: Int {
        searchResults?.items.count ?? 0
    }

    init(githubSearchService: GithubSearchService) {
        self.githubSearchService = githubSearchService
    }

    func search(keyword: String) {
        self.keyword = keyword
        status = .searching
        load(search: keyword, at: 1)
    }

    func loadNextPage() {
        guard let keyword = keyword else {
            assertionFailure(
                "`nextPage()` Shouldn't be called if there are no existing search"
            )
            return
        }

        load(search: keyword, at: page + 1)
    }

    func cellViewModelAt(_ index: Int) -> SearchListCellViewModel? {
        guard let item = searchResults?.items[safe: index] else {
            assertionFailure(
                "`itemAt(_ index: Int)` index \(index) shouldn't over than search results count"
            )
            return nil
        }
        return item.searchListCellViewModel
    }

    func searchItemAt(_ index: Int) -> GithubSearchModel.Item? {
        searchResults?.items[safe: index]
    }

    private func load(search: String, at page: Int) {
        githubSearchService.search(keyword: search, page: page) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case let .success(success):
                if page == 1 {
                    self.searchResults = success
                } else {
                    self.searchResults?.items.append(contentsOf: success.items)
                }
                self.status = .done
            case let .failure(error):
                self.status = .fail(message: error.localizedDescription)
            }
        }
    }
}
