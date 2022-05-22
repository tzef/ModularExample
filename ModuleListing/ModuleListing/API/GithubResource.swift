//
//  GithubResource.swift
//  ModuleListing
//

import Foundation
import ModuleAPI

enum GithubResource {
    static let perPage = 30
    case search(keyword: String, page: Int)

    func path() -> String {
        switch self {
        case let .search(keyword, page):
            return "https://api.github.com/search/repositories?q=\(keyword)&page=\(page)&per_page=\(GithubResource.perPage)"
        }
    }

    func url() -> URL  {
        URL(string: path())!
    }

    func apiRequest<APIModel: Decodable>() -> APIRequest<APIModel> {
        APIRequest<APIModel>(url: url())
    }
}
