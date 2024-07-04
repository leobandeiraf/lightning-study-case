import Lottie
import SnapKit
import UIKit

final class ErrorView: UIView {
    // MARK: - Component(s).
    private lazy var section: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Error")
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    private lazy var descriptionText = Text("Algo deu errado, por gentileza tente novamente")
        .font(Font.subtitle1)
        .lineLimit(0)
        .multilineTextAlignment(.center)
    
    // MARK: - Initialization.
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Configurable.
extension ErrorView: ViewConfigurable {
    func buildViewHierarchy() {
        addSubview(section)
        section.addArrangedSubviews(animationView, descriptionText)
    }
    
    func setupConstraints() {
        section.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview().offset(-48)
        }
    }
}
