//
//  APIManager.swift
//  ModuleCore
//

import Foundation

public final class APIManager {
    public static let shared = APIManager()
    private struct UnknownError: Error {}
    private init() {}

    public typealias Result = Swift.Result<(Data, URLResponse), Error>

    public func request(_ request: URLRequest, completion: @escaping (Result) -> Void ) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response {
                    return (data, response)
                } else {
                    throw UnknownError()
                }
            })
        }.resume()
    }
}
