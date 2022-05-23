//
//  GithubRepository.swift
//  ModuleListing
//

import ModuleCore
import ModuleAPI

final class GithubSearchService {
    typealias Result = Swift.Result<GithubSearchModel, Error>

    func search(keyword: String, page: Int, completion: @escaping (Result) -> Void) {
        let request: APIRequest<GithubSearchResponse> = GithubResource.search(
            keyword: keyword,
            page: page
        ).apiRequest()
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

    func performOnMainQueue(_ closure: @escaping @autoclosure (() -> Void)) {
        if Thread.isMainThread {
            closure()
        } else {
            DispatchQueue.main.async {
                closure()
            }
        }
    }
}
