import UIKit

final class ListCell: TableViewCell {
    // MARK: - Component(s).
    private lazy var publicKeyText = Text()
    private lazy var aliasText = Text()
    private lazy var channelsText = Text()
    private lazy var capacityText = Text()
    private lazy var firstSeenText = Text()
    private lazy var updatedAtText = Text()
    private lazy var cityText = Text()
    private lazy var countryText = Text()
    
    // MARK: - Method(s).
    func configure(with model: String) -> Self {
        return self
    }
    
    // MARK: - View Configurable.
    func buildViewHierarchy() { }
    
    func setupConstraints() { }
}
