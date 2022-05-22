//
//  APIClient.swift
//  ModuleAPI
//

import Foundation

public final class APIClient {
    public static let shared = APIClient()

    public func request<APIModel: Decodable>(
        _ request: APIRequest<APIModel>,
        completion: @escaping (Swift.Result<APIModel, Error>) -> Void
    ) {
        APIManager.shared.request(request.urlRequest()) { result in
            switch result {
            case let .success((data, _)):
                do {
                    let model = try JSONDecoder(
                        dateStrategy: .iso8601
                    ).decode(APIModel.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
