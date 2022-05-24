//
//  SearchStatus+RefreshStatus.swift
//  ModuleListing
//

import ModuleCore
import ModuleUI

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

