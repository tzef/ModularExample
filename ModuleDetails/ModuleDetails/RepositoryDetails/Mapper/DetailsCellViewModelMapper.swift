//
//  DetailsCellViewModelMapper.swift
//  ModuleDetails
//

final class DetailsCellViewModelMapper: RepositoryDetailsViewModelMapper {
    func toLabelValueCellViewModel(
        from model: RepositoryDetailsViewModel.CellViewModel
    ) -> LabelValueCellViewModel {
        LabelValueCellViewModel(
            label: model.label,
            value: model.value,
            isLinkAttributed: model.isLinkAttributed
        )
    }
}

extension RepositoryDetailsViewModel.CellViewModel {
    var label: String {
        switch self {
        case .name:
            return "name"
        case .owner:
            return "owner"
        case .description:
            return "description"
        case .watchers:
            return "watchers"
        case .forks:
            return "forks"
        case .openIssues:
            return  "open issues"
        case .url:
            return "URL"
        case .homePage:
            return "home page"
        case .language:
            return "language"
        case .license:
            return  "license"
        case .createdAt:
            return "created at"
        case .updatedAt:
            return "updated at"
        }
    }

    var value: String {
        switch self {
        case let .name(value):
            return value
        case let .owner(value):
            return value
        case let .description(value):
            return value
        case let .watchers(count):
            return "\(count)"
        case let .forks(count):
            return "\(count)"
        case let .openIssues(count):
            return "\(count)"
        case let .url(url):
            return url
        case let .homePage(url):
            return url
        case let .language(value):
            return value
        case let .license(value):
            return value
        case let .createdAt(date):
            return SharedDateFormatter.shared.format(date)
        case let .updatedAt(date):
            return SharedDateFormatter.shared.format(date)
        }
    }

    var isLinkAttributed: Bool {
        switch self {
        case let .url(url: url), let .homePage(url: url):
            return url.hasPrefix("http")
        default:
            return false
        }
    }
}
