//
//  SearchControllerStatus.swift
//  ModuleSearch
//

public enum SearchControllerStatus {
    case wait
    case searching
    case done
    case fail(message: String)
}

