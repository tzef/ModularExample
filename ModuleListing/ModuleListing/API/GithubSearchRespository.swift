//
//  GithubSearchRepository.swift
//  ModuleListing
//

import Foundation

final class GithubSearchRepository: GithubSearchService {
    func search(
        keyword: String,
        page: Int,
        completion: @escaping (GithubSearchService.Result) -> Void
    ) {
        let resource = GithubResource.search(
            keyword: keyword,
            page: page
        )
        let request = APIRequest<GithubSearchResponse>(url: resource.url())
        APIClient.shared.request(request) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case let .success(response):
                self.performOnMainQueue(completion(.success(response.searchModel)))
            case let .failure(error):
                self.performOnMainQueue(completion(.failure(error)))
            }
        }
    }

    private func performOnMainQueue(_ closure: @escaping @autoclosure (() -> Void)) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
}
