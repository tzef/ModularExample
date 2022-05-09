//
//  HomepageViewModel.swift
//  ModularExample
//

import Foundation

final class HomepageViewModel {
    private let githubSearchService: GithubSearchService

    typealias Observer<T> = (T) -> Void
    var onSearchLoaded: Observer<GithubSearchModel?>?

    init(githubSearchService: GithubSearchService) {
        self.githubSearchService = githubSearchService
    }

    func search() {
        githubSearchService.search(keyword: "swift") { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let success):
                self.onSearchLoaded?(success)
            case .failure:
                self.onSearchLoaded?(nil)
            }
        }
    }
}
