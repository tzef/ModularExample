//
//  HomepageViewModel.swift
//  ModularExample
//

import Foundation

final class HomepageViewModel {
    enum SearchStatus: Equatable {
        case wait
        case searching(keyword: String)
        case done
        case fail(message: String)

        var enableLoadNextPage: Bool {
            switch self {
            case .done:
                return true
            case .wait, .searching, .fail:
                return false
            }
        }
    }

    typealias Observer<T> = (T) -> Void
    var onSearchLoaded: Observer<GithubSearchModel?>?
    var onStatusChanged: Observer<SearchStatus>?

    private let githubSearchService: GithubSearchService
    private var searchResults: GithubSearchModel? {
        didSet {
            onSearchLoaded?(searchResults)
        }
    }
    private var keyword: String?
    private var page = 0

    private(set) var status = SearchStatus.wait {
        didSet {
            onStatusChanged?(status)
        }
    }

    var haveNextPage: Bool {
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
        status = .searching(keyword: keyword)
        load(search: keyword, at: 1)
    }

    func loadNextPage() {
        guard let keyword = keyword else {
            assertionFailure(
                "`nextPage()` Shouldn't be called if there are no existing search"
            )
            return
        }

        guard status == .done else {
            assertionFailure(
                "`nextPage()` Shouldn't be called if previous search was failed"
            )
            return
        }

        load(search: keyword, at: page + 1)
    }

    func itemAt(_ index: Int) -> GithubSearchModel.Item? {
        guard let item = searchResults?.items[safe: index] else {
            assertionFailure(
                "`itemAt(_ index: Int)` index \(index) shouldn't over than search results count"
            )
            return nil
        }
        return item
    }

    private func load(search: String, at page: Int) {
        print("load \(search) page \(page)")
        self.page = page
        githubSearchService.search(keyword: "swift", page: page) { [weak self] result in
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
                print(error)
                self.status = .fail(message: error.localizedDescription)
            }
        }
    }
}
