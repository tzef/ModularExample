//
//  RepositoryListAPIService.swift
//  ModularExample
//

import ModuleAPI
import ModuleListing

final class RepositoryListAPIService: ModuleListing.APIService {
    func request<APIModel>(
        _ request: ModuleListing.APIRequest<APIModel>,
        completion: @escaping (Result<APIModel, Error>) -> Void
    ) where APIModel : Decodable {
        let apiRequest = ModuleAPI.APIRequest<APIModel>(url: request.resource.url)
        APIClient.shared.request(apiRequest, completion: completion)
    }
}
