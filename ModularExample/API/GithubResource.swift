//
//  GithubResource.swift
//  ModularExample
//

import Foundation

enum GithubResource {
    case search(keyword: String)

    func path() -> String {
        switch self {
        case .search(let keyword):
            return "https://api.github.com/search/repositories?q=\(keyword)"
        }
    }

    func url() -> URL  {
        URL(string: path())!
    }

    func request() -> URLRequest {
        URLRequest(url: url())
    }
}
