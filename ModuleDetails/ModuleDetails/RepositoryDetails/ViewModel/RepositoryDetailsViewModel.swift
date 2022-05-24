//
//  RepositoryDetailsViewModel.swift
//  ModuleExample
//

final class RepositoryDetailsViewModel {
    enum CellViewModel {
        case name(value: String)
        case owner(value: String)
        case description(value: String)
        case watchers(count: Int)
        case forks(count: Int)
        case openIssues(count: Int)
        case url(url: String)
        case homePage(url: String)
        case language(value: String)
        case license(value: String)
        case createdAt(date: Date?)
        case updatedAt(date: Date?)

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

        var viewModel: LabelValueCellViewModel {
            LabelValueCellViewModel(
                label: label,
                value: value,
                isLinkAttributed: isLinkAttributed
            )
        }
    }

    private let tableData: [CellViewModel]
    private let item: GithubSearchModel.Item

    init(item: GithubSearchModel.Item) {
        self.item = item
        self.tableData = [
            .name(value: item.name),
            .owner(value: item.owner),
            .description(value: item.description),
            .language(value: item.language),
            .watchers(count: item.watchers),
            .openIssues(count: item.openIssues),
            .forks(count: item.forks),
            .url(url: item.url),
            .homePage(url: item.homePage),
            .license(value: item.license),
            .createdAt(date: item.createdAt),
            .updatedAt(date: item.updatedAt)
        ]
    }

    var title: String {
        item.name
    }

    var numberOfRows: Int {
        tableData.count
    }

    func cellViewModelAt(_ index: Int) -> LabelValueCellViewModel? {
        tableData[safe: index]?.viewModel
    }
}
