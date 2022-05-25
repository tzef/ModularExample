//
//  GithubRepository.swift
//  ModuleListing
//

public protocol GithubSearchService {
    typealias Result = Swift.Result<GithubSearchModel, Error>

    func search(keyword: String, page: Int, completion: @escaping (Result) -> Void)
}
