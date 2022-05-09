//
//  GithubRepository.swift
//  ModularExample
//

import Foundation

final class GithubSearchService {
    typealias Result = Swift.Result<GithubSearchModel, Error>

    func search(keyword: String, completion: @escaping (Result) -> Void) {
        let request = GithubResource.search(keyword: "swift").request()
        APIManager.shared.request(request) { result in
            guard let self = self else {
                return
            }

            switch result {
            case let .success((data, _)):
                do {
                    let response = try JSONDecoder(
                        dateStrategy: .iso8601
                    ).decode(GithubSearchResponse.self, from: data)
                    self.performOnMainQueue(completion(.success(response.searchModel)))
                } catch {
                    self.performOnMainQueue(completion(.failure(error)))
                }
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
