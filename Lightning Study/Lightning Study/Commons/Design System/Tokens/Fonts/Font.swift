import UIKit

enum Font {
    // MARK: - Public Property(ies).
    
    /// Size: 32. Bolded.
    static var headline: BoldedStyle = .init(size: 32, style: .headline)

    /// Size: 28. Bolded.
    static var subheadline: BoldedStyle = .init(size: 26, style: .subheadline)

    /// Size: 22. Medium.
    static var title3: MediumStyle = .init(size: 22, style: .title3)
    
    /// Size: 18. Medium.
    static var subtitle1: MediumStyle = .init(size: 18, style: .body)
    
    /// Size: 18. Regular.
    static var subtitle2: UnderlinedStyle = .init(size: 18, style: .body)
    
    /// Size: 16. Regular.
    static var paragraph1: UnderlinedStyle = .init(size: 16, style: .body)

    /// Size: 14. Regular.
    static var paragraph2: UnderlinedStyle = .init(size: 14, style: .footnote)

    /// Size: 12. Regular.
    static var label: UnderlinedStyle = .init(size: 12, style: .caption1)
}
