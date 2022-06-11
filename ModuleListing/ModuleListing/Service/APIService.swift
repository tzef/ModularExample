//
//  APIService.swift
//  ModuleListing
//

public protocol APIService {
    func request<APIModel: Decodable>(
        _ request: APIRequest<APIModel>,
        completion: @escaping (Swift.Result<APIModel, Error>) -> Void
    )
}

