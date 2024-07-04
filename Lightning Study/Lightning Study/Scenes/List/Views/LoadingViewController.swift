import Lottie
import SnapKit
import UIKit

final class LoadingViewController: UIViewController {
    // MARK: - Component(s).
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.background(color: .black)
        view.opacity(.none)
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.background(color: .white)
        view.corner(radius: .medium)
        view.opacity(.none)
        return view
    }()
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Loading")
        animationView.opacity(.none)
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    // MARK: - Overridew(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    // MARK: - Method(s).
    func start(in viewController: UIViewController) {
        modalPresentationStyle = .overCurrentContext
        viewController.present(self, animated: false)
    }
    
    func stop(in viewController: UIViewController) {
        UIView.animate(withDuration: 0.35, delay: 0.5, options: .curveEaseInOut) {
            self.containerView.opacity(.none)
            self.animationView.opacity(.none)
            self.dimmedView.opacity(.none)
        } completion: { _ in
            viewController.dismiss(animated: false)
        }
    }
}

// MARK: - View Configurable.
extension LoadingViewController: ViewConfigurable {
    func buildViewHierarchy() {
        view.addSubviews(dimmedView, containerView)
        containerView.addSubview(animationView)
    }
    
    func setupConstraints() {
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        animationView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
            $0.size.equalTo(100)
        }
    }
    
    func configureViews() {
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseInOut) {
            self.dimmedView.opacity(.light)
        } completion: { _ in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut) {
                self.containerView.opacity(.full)
                self.animationView.opacity(.full)
            }
        }
    }
}
