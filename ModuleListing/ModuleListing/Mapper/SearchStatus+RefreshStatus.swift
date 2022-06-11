//
//  SearchStatus+RefreshStatus.swift
//  ModuleListing
//

extension SearchStatus {
    var refreshStatus: RefreshControllerStatus {
        switch self {
        case .wait, .done:
            return .none
        case .searching, .fail:
            return .refreshing
        }
    }
}

