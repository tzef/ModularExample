//
//  GithubResource.swift
//  ModularExample
//

import Foundation

enum GithubResource {
    case search(keyword: String, page: Int)

    func path() -> String {
        switch self {
        case let .search(keyword, page):
            return "https://api.github.com/search/repositories?q=\(keyword)&page=\(page)"
        }
    }

    func url() -> URL  {
        URL(string: path())!
    }

    func request() -> URLRequest {
        URLRequest(url: url())
    }
}
