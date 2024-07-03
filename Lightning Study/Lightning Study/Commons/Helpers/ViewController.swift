import UIKit

class ViewController<ViewModel, Coordinator>: UIViewController, ViewConfigurable {
    // MARK: - Property(ies).
    let viewModel: ViewModel?
    var coordinator: Coordinator?
    
    // MARK: - Initialization.
    init(viewModel: ViewModel?, coordinator: Coordinator?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Override(s).
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    // MARK: - ViewConfigurable.
    func buildViewHierarchy() { }
    func setupConstraints() { }
    func configureViews() { }
}
