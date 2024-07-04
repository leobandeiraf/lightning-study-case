import SnapKit
import UIKit

final class ListCell: TableViewCell {
    // MARK: - Component(s).
    private lazy var updatedAtSection: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var updatedAtLabelText = Text("Última atualização: ")
        .font(Font.label)
        .foreground(color: .neutralColor03)
        .bold()
    
    private lazy var updatedAtText = Text()
        .font(Font.label)
        .foreground(color: .neutralColor03)
    
    private lazy var aliasText = Text()
        .font(Font.headline)
        .foreground(color: .mainColor)
    
    private lazy var capacityText = Text()
        .font(Font.subheadline)
        .multilineTextAlignment(.right)
    
    private lazy var bodySection: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private lazy var publicKeySection: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var channelsSection: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var publicKeyLabelText = Text("Chave pública: ")
        .font(Font.label)
        .foreground(color: .neutralColor03)
        .bold()
    
    private lazy var publicKeyText = Text()
        .compressionResistance(.defaultLow, .horizontal)
        .font(Font.label)
        .foreground(color: .neutralColor03)
    
    private lazy var channelsLabelText = Text("Canais: ")
        .font(Font.label)
        .foreground(color: .neutralColor03)
        .bold()
    
    private lazy var channelsText = Text()
        .compressionResistance(.defaultLow, .horizontal)
        .font(Font.label)
        .foreground(color: .neutralColor03)
    
    private lazy var footerSection: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var firstSeenSection: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private lazy var firstSeenLabelText = Text("Primeira vez visto: ")
        .font(Font.label)
        .bold()
    
    private lazy var firstSeenText = Text()
        .font(Font.label)
    
    private lazy var regionText = Text()
        .font(Font.label)
    
    // MARK: - Initialization.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method(s).
    func configure(with model: Node) -> Self {
        updatedAtText.value = model.updatedAt.date
        aliasText.value = model.alias
        capacityText.value = model.capacity.bitcoin
        publicKeyText.value = model.publicKey
        channelsText.value = model.channels.description
        firstSeenText.value = String()
        guard let city = model.city else {
            regionText.value = "\(model.country?.ptBR ?? String())."
            return self
        }
        regionText.value = "\(model.city?.ptBR ?? String()), \(model.country?.ptBR ?? String())."
        return self
    }
    
    // MARK: - View Configurable.
    func buildViewHierarchy() {
        contentView.addSubviews(updatedAtSection, aliasText, capacityText, bodySection)
        
        updatedAtSection.addArrangedSubviews(updatedAtLabelText, updatedAtText)
        
        bodySection.addArrangedSubviews(publicKeySection, channelsSection)
        publicKeySection.addArrangedSubviews(publicKeyLabelText, publicKeyText)
        channelsSection.addArrangedSubviews(channelsLabelText, channelsText)
//        
//        footerSection.addArrangedSubviews(firstSeenSection, regionText)
//        firstSeenSection.addArrangedSubviews(firstSeenLabelText, firstSeenText)
        
    }
    
    func setupConstraints() {
        updatedAtSection.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        aliasText.snp.makeConstraints {
            $0.top.equalTo(updatedAtSection.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        capacityText.snp.makeConstraints {
            $0.top.equalTo(aliasText.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        bodySection.snp.makeConstraints {
            $0.top.equalTo(capacityText.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
