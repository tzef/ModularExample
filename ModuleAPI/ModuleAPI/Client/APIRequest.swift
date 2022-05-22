//
//  APIRequest.swift
//  ModuleAPI
//

import Foundation

public struct APIRequest<APIModel: Decodable> {
    var url: URL

    public init(url: URL) {
        self.url = url
    }

    func urlRequest() -> URLRequest {
        URLRequest(url: url)
    }
}
