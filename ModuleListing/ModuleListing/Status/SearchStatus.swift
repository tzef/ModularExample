//
//  SearchStatus.swift
//  ModuleListing
//

public enum SearchStatus: Equatable {
    case wait
    case searching
    case done
    case fail(message: String)

    var enableLoadNextPage: Bool {
        switch self {
        case .done:
            return true
        case .wait, .searching, .fail:
            return false
        }
    }
}

