//
//  SharedNumberFormatter.swift
//  ModuleDetails
//

final class SharedDateFormatter {
    static let shared = SharedDateFormatter()
    private init() {}

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    func format(_ date: Date?) -> String {
        guard let date = date else {
            return "--"
        }
        return dateFormatter.string(from: date)
    }
}
