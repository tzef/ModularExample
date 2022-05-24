//
//  SearchStatus+SearchControllerStatus.swift
//  ModularExample
//

import ModuleSearch

extension SearchStatus {
    var searchControllerStatus: SearchControllerStatus {
        switch self {
        case .wait:
            return .wait
        case .searching:
            return .searching
        case .done:
            return .done
        case .fail(let message):
            return .fail(message: message)
        }
    }
}

