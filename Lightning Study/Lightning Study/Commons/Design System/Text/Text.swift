import UIKit

/**
 This class encapsule UILabe from UIKit.

 ## Discursion ##
 1. We recommend this component places where We need to put text to show on screen.
 2. This component can be customized with many styles.
 3. To development this component We used UILabel by default and our Protocols.

 ### Usage Mode: ###
 ```swift
 let textLabel: Text = {
 let text = Text()
 text.value = "String padrão"
 return text
 }()
 ```
 */

class Text: UILabel {
    /// Internal Struct for NSAttributedString configuration
    struct AttributedText: Hashable, Equatable {
        func hash(into hasher: inout Hasher) {
            hasher.combine(key)
            hasher.combine(range)
        }

        static func == (lhs: Text.AttributedText, rhs: Text.AttributedText) -> Bool {
            lhs.key == rhs.key &&
            lhs.range == rhs.range
        }

        var key: NSAttributedString.Key
        var value: Any
        var range: Range

        enum Range: Hashable, Equatable {
            case full
            case custom(NSRange?)
        }
    }

    // MARK: - Private Property(ies).
    var defaultFont: any FontStyle = Font.paragraph1
    private var defaultForegroundColor: Color = .black
    private var maximumPointSize: CGFloat?

    private var isBold = false
    private var isItalic = false
    
    // MARK: - Public Property(ies).
    /// This **property** is a string that used to set or get value to the component Text.
    var value: String {
        didSet { update() }
    }

    /// This **property** is a plain string based in formated value.
    var plainText: String {
        attributedText?.string ?? String()
    }

    // MARK: - Initialization(s).
    init(_ value: String = "") {
        self.value = value
        super.init(frame: .zero)
        update()
    }

    required init(stringLiteral value: String) {
        self.value = value
        super.init(frame: .zero)
        update()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Function(s).
    /// This function adjusts the frame to fit content size.
    @discardableResult
    func sizeToFit() -> Text {
        self.inputView?.sizeToFit()
        return self
    }

    /// This function set the alpha of the content.
    ///
    /// - Parameters:
    /// - alpha: The ***alpha*** is a CGFloat that indicates the opacity of the content that values between 0.0 and 1.0.
    ///
    /// - Returns: Component Text.
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Text {
        self.alpha = alpha
        return self
    }

    /// This function set the transform of the content.
    ///
    /// - Parameters:
    /// - transform: The ***transform*** is a CGAffineTransform that indicates the content representation without changing it's original frame.
    ///
    /// - Returns: Component Text.
    @discardableResult
    func transform(_ transform: CGAffineTransform) -> Text {
        self.transform = transform
        return self
    }

    /// This function set if text adjusts or not for a new content size.
    ///
    /// - Parameters:
    /// - value: The ***value*** is a boolean that indicates whether the object automatically updates its font when the device's content size category changes.
    ///
    /// - Returns: Component Text.
    @discardableResult
    func adjustsFontForContentSize(_ value: Bool = true) -> Text {
        adjustsFontForContentSizeCategory = value
        return self
    }

    /// This function changes the background of content.
    ///
    /// - Parameters:
    ///     - c: The ***color***  is a Color from Design System.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func background(color c: Color, range: NSRange? = nil) -> Text {
        setAttributes(.init(key: .backgroundColor, value: c.color, range: range == nil ? .full : .custom(range)))
        return self
    }

    /// This function sets border to the content.
    ///
    /// - Parameters:
    ///      - border: The ***size***  Border is a enum with options values.
    ///      - color: The ***color***  Color from Design System..
    ///      - style: The ***style***  Border.Style is a enum with options values.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func border(size: Border, color: Color = .init(UIColor.white.hex), style: Border.Style = .solid) -> Text {
        border(size: size, style: style, color: color)
        return self
    }

    /// This function sets break mode for lines of contents.
    ///
    /// - Parameters:
    ///      - mode: The ***mode*** is param that specify what happens when a line is too long for a container.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func `break`(_ mode: NSLineBreakMode) -> Text {
        lineBreakMode = mode
        return self
    }

    /// This function reset all content style.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func clear() -> Text {
        isBold = false
        isItalic = false
        value = attributedText?.string ?? ""
        return self
    }

    /// This function sets the priority with which a view resists being made smaller than its intrinsic size.
    ///
    /// - Parameters:
    ///      - priority: The ***priority*** is indicate to the constraint-based layout system which constraints are more important, allowing the system to make appropriate tradeoffs when satisfying the constraints of the system as a whole.
    ///      - axis: The ***axis*** is that specify a horizontal or vertical layout constraint between objects.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func compressionResistance(_ priority: UILayoutPriority, _ axis: NSLayoutConstraint.Axis) -> Text {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }

    /// This function sets the priority with which a view shrinks being made smaller than its intrinsic size.
    ///
    /// - Parameters:
    ///      - priority: The ***priority*** is indicate to the constraint-based layout system which constraints are more important, allowing the system to make appropriate tradeoffs when satisfying the constraints of the system as a whole.
    ///      - axis: The ***axis*** is that specify a horizontal or vertical layout constraint between objects.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func contentHugging(_ priority: UILayoutPriority, _ axis: NSLayoutConstraint.Axis) -> Text {
        setContentHuggingPriority(priority, for: axis)
        return self
    }

    /// This function changes the weight content to **bold**.
    ///
    /// - Parameters:
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func bold(range: NSRange? = nil) -> Text {
        if range == nil { isBold = true }
        setTraits(bold: true, range: range)
        return self
    }

    /// This function changes the style content to *italic*.
    ///
    /// - Parameters:
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func italic(range: NSRange? = nil) -> Text {
        if range == nil { isItalic = true }
        setTraits(italic: true, range: range)
        return self
    }

    /// This function changes the weight content to regular.
    ///
    /// - Parameters:
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func regular(range: NSRange? = nil) -> Text {
        setTraits(bold: false, italic: false, range: range)
        return self
    }
    /// This function changes the system default font to a custom font.
    ///
    /// - Parameters:
    ///     - font: The ***font*** param is a **FontStyle**, that it is a protocol with getters and setters for font style.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func font(_ font: any FontStyle, range: NSRange? = nil, maximumPointSize: CGFloat? = nil) -> Text {
        if range == nil { defaultFont = font }
        self.maximumPointSize = maximumPointSize
        guard let uiFont = UIFont(font: font.fontName, size: font.size) else {
            debugPrint("Unable to initialize font '\(font.fontName)' (\(font.size))")
            return self
        }

        let actualRange: AttributedText.Range = range == nil ? .full : .custom(range)
        setAttributes(.init(key: .font, value: preferredFont(font: font, uiFont: uiFont), range: actualRange))
        setAttributes(.init(key: .accessibilityTextCustom, value: font, range: actualRange))

        if isBold {  bold() }
        if isItalic { italic() }

        return self
    }

    /// This function changes the color of content.
    ///
    /// - Parameters:
    ///     - color: The ***color***  is a Color from Design System. Your default value is Black.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func foreground(color c: Color, range: NSRange? = nil) -> Text {
        if range == nil { defaultForegroundColor = c }
        setAttributes(.init(key: .foregroundColor, value: c.color, range: range == nil ? .full : .custom(range)))
        return self
    }

    /// This function changes the color of content.
    ///
    /// - Parameters:
    ///     - highlights: The ***highlitghts***  is a Dict of String and Color from Design System.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func foreground(highlights: [String: Color]) -> Text {
        highlights.forEach {
            if let range = plainText.range(of: $0.key) {
                let nsRange = NSRange(range, in: plainText)
                setAttributes(.init(key: .foregroundColor, value: $0.value.color, range: .custom(nsRange)))
            }
        }
        return self
    }
    
    @discardableResult
    func isUserInteractionEnabled(_ value: Bool = false) -> Text {
        isUserInteractionEnabled = value
        return self
    }

    /// This function sets the content is hidden or not.
    ///
    /// - Parameters:
    /// - value: The ***value*** is a boolean that control if the content is hidden or not.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func hidden(_ value: Bool = true) -> Text {
        isHidden = value
        return self
    }

    /// This function sets layout priority.
    ///
    /// - Parameters:
    ///      - priority: The ***priority*** is indicate to the constraint-based layout system which constraints are more important, allowing the system to make appropriate tradeoffs when satisfying the constraints of the system as a whole.
    ///      - axis: The ***axis*** is that specify a horizontal or vertical layout constraint between objects.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func layoutPriority(_ priority: UILayoutPriority, _ axis: NSLayoutConstraint.Axis) -> Text {
        setContentHuggingPriority(priority, for: axis)
        return self
    }

    /// This function sets line limit to the content.
    ///
    /// - Parameters:
    ///      - lines: The ***lines*** is Int value to sets the limiti.
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func lineLimit(_ lines: Int = 1) -> Text {
        numberOfLines = lines
        return self
    }

    /// This function sets link style to the content.
    ///
    /// - Parameters:
    ///     - url: The ***url***  is a string.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func link(_ url: String, range: NSRange? = nil) -> Text {
        setAttributes(.init(key: .link, value: url, range: range == nil ? .full : .custom(range)))
        return self
    }

    /// This function sets content alignment.
    ///
    /// - Parameters:
    ///      - alignment: The ***alignment*** is param that specify content alignment.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func multilineTextAlignment(_ alignment: NSTextAlignment = .left) -> Text {
        textAlignment = alignment
        return self
    }

    /// This function put a line over the content.
    ///
    /// - Parameters:
    ///     - c: The ***c***  is a Color from Design System.
    ///     - blur: The ***blur*** is param define the **blur** efect to content.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func shadow(color c: Color = .init(UIColor.black.hex), blur: CGFloat = 1, range: NSRange? = nil) -> Text {
        let shadow = NSShadow()
        shadow.shadowColor = c.color
        shadow.shadowBlurRadius = blur

        setAttributes(.init(key: .shadow, value: shadow, range: range == nil ? .full : .custom(range)))
        return self
    }

    /// This function put a line over the content.
    ///
    /// - Parameters:
    ///     - active: The ***active***  is a boolean that control when line will appear or not.
    ///     - color: The ***color***  is a Color from Design System.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func strikethrough(_ active: Bool = true, color c: Color = .init(UIColor.black.hex), range: NSRange? = nil) -> Text {
        if active {
            setAttributes(.init(key: .strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: range == nil ? .full : .custom(range)))
            setAttributes(.init(key: .strikethroughColor, value: c.color, range: range == nil ? .full : .custom(range)))
        }

        return self
    }

    /// This function put a line under the content.
    ///
    /// - Parameters:
    ///     - active: The ***active***  is a boolean that control when line will appear or not.
    ///     - color: The ***color***  is a Color from Design System.
    ///     - range: The ***range*** is a structure used to describe a portion of a series, such as characters in a string or objects in an array.
    ///
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func underline(_ active: Bool = true, color c: Color = .init(UIColor.black.hex), range: NSRange? = nil) -> Text {
        if active {
            setAttributes(.init(key: .underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range == nil ? .full : .custom(range)))
            setAttributes(.init(key: .underlineColor, value: c.color, range: range == nil ? .full : .custom(range)))
        }

        return self
    }

    /// A Boolean value that determines whether the label reduces the text’s font size to fit the title string into the label’s bounding rectangle.
    ///
    /// - Parameters:
    ///     - value: The ***value***  is a boolean to enable adjustsFontSizeToFitWidth in Interface Builder, choose Minimum Font Scale from the Autoshrink pop-up menu in the label’s Attributes inspector.
    ///     
    /// - Returns: Component Text with style applicated.
    @discardableResult
    func sizeToFit(_ value: Bool) -> Self {
        adjustsFontSizeToFitWidth = value
        return self
    }

    // MARK: - Internal Function(s).

    private func setAttributes(_ newMember: AttributedText) {
        let currentAttributedText = attributedText ?? NSAttributedString(string: String())
        let mutableAttributedText = NSMutableAttributedString(attributedString: currentAttributedText)

        var currentRange = NSRange(location: 0, length: mutableAttributedText.string.utf16.count)
        if case let .custom(range) = newMember.range, let range = range {
            currentRange = range
        }
        mutableAttributedText.addAttribute(newMember.key, value: newMember.value, range: currentRange)

        attributedText = mutableAttributedText
    }

    private func update() {
        attributedText = NSAttributedString(string: value)
        adjustsFontForContentSizeCategory = true
        isAccessibilityElement = true
        translatesAutoresizingMaskIntoConstraints = false
        font(defaultFont, maximumPointSize: maximumPointSize)
        foreground(color: defaultForegroundColor)
    }

    private func setTraits(bold: Bool? = nil, italic: Bool? = nil, range: NSRange? = nil) {
        let currentAttributedText = attributedText ?? NSAttributedString(string: "")
        let currentRange = range ?? NSRange(location: 0, length: currentAttributedText.string.count)

        currentAttributedText.enumerateAttribute(.accessibilityTextCustom, in: currentRange) { value, enumeratedRange, _ in
            if var font = value as? UnderlinedStyle as (any FontStyle)? {
                setFontAttributes(font: &font, enumeratedRange: enumeratedRange, bold: bold, italic: italic, range: range)
            }
            if var font = value as? BoldedStyle as (any FontStyle)? {
                setFontAttributes(font: &font, enumeratedRange: enumeratedRange, bold: bold, italic: italic, range: range)
            }
        }
    }

    private func setFontAttributes(font: inout any FontStyle, enumeratedRange: NSRange, bold: Bool? = nil, italic: Bool? = nil, range: NSRange? = nil) {
        if let isBold = bold { font.isBold = isBold }
        if let isItalic = italic { font.isItalic = isItalic }

        guard let uiFont = UIFont(font: font.fontName, size: font.size) else { return }
        setAttributes(.init(key: .font, value: preferredFont(font: font, uiFont: uiFont), range: .custom(enumeratedRange)))
        setAttributes(.init(key: .accessibilityTextCustom, value: font, range: .custom(enumeratedRange)))
    }

    private func preferredFont(font: any FontStyle, uiFont: UIFont) -> UIFont {
        let preferred = UIFontMetrics(forTextStyle: font.style)
        var preferredFont = preferred.scaledFont(for: uiFont)
        if let maximumPointSize = maximumPointSize {
            preferredFont = preferred.scaledFont(for: uiFont, maximumPointSize: maximumPointSize)
        }
        return preferredFont
    }

    @discardableResult
    func font(_ font: UIFont, _ range: NSRange? = nil) -> Text {
        let actualRange: AttributedText.Range = range == nil ? .full : .custom(range)
        setAttributes(.init(key: .font, value: font, range: actualRange))
        setAttributes(.init(key: .accessibilityTextCustom, value: font, range: actualRange))
        return self
    }
}

extension Text {
    /// Internal Enum for Markdown cases
    enum ParseTags: String, CaseIterable {
        case mkBoldPattern1 = "\\*\\*(.*?\\S)\\*\\*" // **
        case mkBoldPattern2 = "__(.*?\\S)__" // __
        case mkItalicPattern1 = "\\*(.*?\\S)\\*" // *
        case mkItalicPattern2 = "_(.*?\\S)_" // _
        case mkStrikethrough = "\\~\\~(.*?\\S)\\~\\~" // ~~
        case mkLinkPattern = "\\[(.*?)\\]\\((.*?)\\)" // [text](link)

        case htmlBreakLinePatter1 = "<br>"
        case htmlBreakLinePatter2 = "<br/>"
        case htmlBreakLinePatter3 = "<br />"
        case htmlBoldPattern1 = "<b>(.*?)</b>"
        case htmlBoldPattern2 = "<strong>(.*?)</strong>"
        case htmlItalicPattern1 = "<i>(.*?)</i>"
        case htmlItalicPattern2 = "<em>(.*?)</em>"
        case htmlStrikethrough1 = "<del>(.*?)</del>"
        case htmlStrikethrough2 = "<s>(.*?)</s>"
        case htmlLinkPattern = "<a href=\"(.*?)\">(.*?)</a>"
        case htmlColorPattern1 = "<span color=\"(.*?)\">(.*?)</span>"
        case htmlColorPattern2 = "<span style=\"color: (.*?)\">(.*?)</span>"
        case htmlColorPattern3 = "<font color=\"(.*?)\">(.*?)</font>"
        case htmlUnderlinePattern1 = "<u>(.*?)</u>"
        case htmlUnderlinePattern2 = "<ins>(.*?)</ins>"
    }

    @discardableResult
    func markdown(_ text: String? = nil) -> Text {
        if let newString = text { value = newString }
        parseText(.mkBoldPattern1, .mkBoldPattern2) { range, _ in
            self.bold(range: range)
        }
        parseText(.mkItalicPattern1, .mkItalicPattern2) { range, _ in
            self.italic(range: range)
        }
        parseText(.mkStrikethrough) { range, _ in
            self.strikethrough(range: range)
        }
        parseText(.mkLinkPattern, inverted: true) { range, value in
            self.link(value, range: range)
        }
        return self
    }

    @discardableResult
    func html(_ text: String? = nil) -> Text {
        if let newString = text { value = newString }
        let lineBreaks: [ParseTags] = [.htmlBreakLinePatter1, .htmlBreakLinePatter2, .htmlBreakLinePatter3]
        lineBreaks.forEach { pattern in
            guard let attText = self.attributedText,
                  let regex = try? NSRegularExpression(pattern: pattern.rawValue, options: [.dotMatchesLineSeparators]) else { return }

            let range = NSRange(location: 0, length: attText.length)
            let matches = regex.matches(in: attText.string, options: [], range: range)

            matches.reversed().forEach { match in
                if let currentText = self.attributedText {
                    let text = NSMutableAttributedString(attributedString: currentText)
                    text.replaceCharacters(in: match.range(at: 0), with: "\n")
                    self.attributedText = text
                }
            }
        }
        parseText(.htmlBoldPattern1, .htmlBoldPattern2) { range, _ in
            self.bold(range: range)
        }
        parseText(.htmlItalicPattern1, .htmlItalicPattern2) { range, _ in
            self.italic(range: range)
        }
        parseText(.htmlStrikethrough1, .htmlStrikethrough2) { range, _ in
            self.strikethrough(range: range)
        }
        parseText(.htmlLinkPattern, inverted: true) { range, value in
            self.link(value, range: range)
        }
        parseText(.htmlColorPattern1, .htmlColorPattern2, .htmlColorPattern3) { range, value in
            self.foreground(color: Color(value), range: range)
        }
        parseText(.htmlUnderlinePattern1, .htmlUnderlinePattern2) { range, _ in
            self.underline(true, color: .init(UIColor.green.hex), range: range)
        }
        return self
    }

    private func parseText(_ patterns: ParseTags..., inverted: Bool = false, process: @escaping (NSRange, String) -> Void) {
        patterns.forEach { pattern in
            guard
                let regex = try? NSRegularExpression(pattern: pattern.rawValue, options: [.dotMatchesLineSeparators])
            else { return }

            let range = NSRange(location: 0, length: attributedText?.length ?? 0)
            let matches = regex.matches(in: attributedText?.string ?? "", options: [], range: range)

            matches.reversed().forEach { match in
                internalParse(match: match, inverted: inverted, process: process)
            }
        }
    }

    private func internalParse(match: NSTextCheckingResult, inverted: Bool, process: @escaping (NSRange, String) -> Void) {
        let currentAttributedString = attributedText ?? NSAttributedString()
        let mutableString = NSMutableAttributedString(attributedString: currentAttributedString)

        var matchRange = 1
        var value: String?

        switch match.numberOfRanges {
        case 3:
            value = mutableString.attributedSubstring(from: match.range(at: inverted ? 2 : 1)).string
            matchRange = inverted ? 1 : 2
        default:
            matchRange = inverted ? 2 : 1
        }

        let newString = mutableString.attributedSubstring(from: match.range(at: matchRange))
        let originalRange = NSRange(location: match.range(at: 0).location,
                                 length: match.range(at: matchRange).length)

        mutableString.replaceCharacters(in: match.range(at: 0), with: newString)
        attributedText = mutableString
        process(originalRange, value ?? "")
    }
}
