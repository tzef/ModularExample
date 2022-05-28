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
            switch result {
            case let .success((data, _)):
                do {
                    let response = try JSONDecoder(
                        dateStrategy: .iso8601
                    ).decode(GithubSearchResponse.self, from: data)
                    completion(.success(response.searchModel))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
