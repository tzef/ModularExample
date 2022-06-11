//
//  GithubSearchRepositoryMapper.swift
//  ModuleListing
//

protocol GithubSearchRepositoryMapper {
    func toSearchModel(from response: GithubSearchResponse) -> GithubSearchModel
}
