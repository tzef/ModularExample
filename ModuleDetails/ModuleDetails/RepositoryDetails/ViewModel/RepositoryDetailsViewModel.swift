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
    }

    private let viewModelMapper: RepositoryDetailsViewModelMapper
    private let tableData: [CellViewModel]
    private let item: SearchItemModel

    init(
        item: SearchItemModel,
        viewModelMapper: RepositoryDetailsViewModelMapper
    ) {
        self.item = item
        self.viewModelMapper = viewModelMapper
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
        guard let model = tableData[safe: index] else {
            assertionFailure("cell model at \(index) not exist")
            return nil
        }
        return viewModelMapper.toLabelValueCellViewModel(from: model)
    }
}
