//
//  LabelValueCellViewModel.swift
//  ModuleDetails
//

import Foundation

struct LabelValueCellViewModel {
    let label: String
    let value: String
    let isLinkAttributed: Bool

    var valueAttributedText: NSAttributedString {
        if isLinkAttributed {
            return NSAttributedString(
                string: value,
                attributes: [.link : value]
            )
        } else {
            return NSAttributedString(string: value)
        }
    }
}
