//
//  SearchStatus+RefreshStatus.swift
//  ModuleListing
//

extension SearchStatus {
    var isRefreshing: Bool {
        switch self {
        case .wait, .done, .fail:
            return false
        case .searching:
            return true
        }
    }
}

