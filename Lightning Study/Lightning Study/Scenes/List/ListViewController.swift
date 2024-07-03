import UIKit

protocol ListDisplaying: AnyObject {
    func displaySomething()
}

private extension ListViewController.Layout {
    enum Size {
        static let imageHeight: CGFloat = 90.0
    }
}

final class ListViewController: ViewController<ListViewModeling, ListCoordinating> {
    // MARK: - Property(ies).
    fileprivate enum Layout {}
    
    // MARK: - Component(s).
    
    // MARK: - Override(s).
    
    // MARK: - ViewConfiguration.
    override func buildViewHierarchy() {}
    
    override func setupConstraints() {}
        
    override func configureViews() {}
    
    // MARK: - Method(s).
    
    // MARK: - Update(s)
        
    // MARK: - Setup(s).
    
}

// MARK: - ListDisplaying
extension ListViewController: ListDisplaying {
    func displaySomething() {
        // template
    }
}
