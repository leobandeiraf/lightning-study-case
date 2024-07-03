public protocol ViewConfigurable: AnyObject {
    func buildLayout()
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewConfigurable {
    func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
}
