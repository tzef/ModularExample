//
//  APIManager.swift
//  ModularExample
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    private init() {}

    typealias CompletionResult = Result<Data?, Error>
    func request(_ request: URLRequest, completion: @escaping (CompletionResult) -> Void ) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
