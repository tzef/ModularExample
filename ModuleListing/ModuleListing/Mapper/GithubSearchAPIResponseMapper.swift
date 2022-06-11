//
//  GithubSearchAPIResponseMapper.swift
//  ModuleListing
//

final class GithubSearchAPIResponseMapper: GithubSearchRepositoryMapper {
    func toSearchModel(
        from response: GithubSearchResponse
    ) -> GithubSearchModel {
        GithubSearchModel(
            total: response.totalCount,
            items: response.items.map {
                GithubSearchModel.Item(
                    id: $0.id,
                    name: unwrapString($0.name),
                    owner: unwrapString($0.owner.login),
                    fullName: unwrapString($0.fullName),
                    description: unwrapString($0.description),
                    language: unwrapString($0.language),
                    forks: $0.forks ?? 0,
                    watchers: $0.watchers ?? 0,
                    openIssues: $0.openIssuesCount ?? 0,
                    url: unwrapString($0.htmlUrl),
                    homePage: unwrapString($0.homepage),
                    license: unwrapString($0.license?.name),
                    createdAt: $0.createdAt,
                    updatedAt: $0.updatedAt
                )
            }
        )
    }

    private func unwrapString(_ value: Optional<String>) -> String {
        switch value {
        case .none:
            return "NA"
        case let .some(unwrapped):
            return unwrapped.isEmpty ? "NA" : unwrapped
        }
    }
}
