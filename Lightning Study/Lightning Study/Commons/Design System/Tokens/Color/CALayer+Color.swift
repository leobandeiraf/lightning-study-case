import QuartzCore
import UIKit

extension CALayer {
    func border(color: Color, width: Border = .small) {
        self.borderColor = color.color.cgColor
        self.borderWidth = width.rawValue
    }
    
    func border(edge: UIRectEdge = .all, thickness: CGFloat, color: Color) {
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:  border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case UIRectEdge.bottom: border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)
        case UIRectEdge.left: border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)
        case UIRectEdge.right: border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default: border.frame = frame
        }
        
        border.backgroundColor = color.color.cgColor
        addSublayer(border)
    }

    func background(color: Color) {
        self.backgroundColor = color.color.cgColor
    }
}
