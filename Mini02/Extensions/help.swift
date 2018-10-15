
import Foundation
import UIKit

//MARK: UILabel Extension

extension UILabel {
    
    enum AlignmentText {
        case center, right, left
    }
    //MARK: set Label
    //Set all label states without affect the constraints
    func setLabelWhithConstraints(fontSize: Int, lblText: String, textColor: UIColor, alingnment : AlignmentText, alpha: CGFloat) {
        
        //lblInfomonth.font =  UIFont(name: "", size: 10)
        //self.font = UIFont.boldSystemFont(ofSize: <#T##CGFloat#>)
        self.font = self.font.withSize(CGFloat(fontSize))
        self.textColor = textColor.withAlphaComponent(alpha)
        self.text = lblText
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 2
        
        switch alingnment {
        case .center:
            self.textAlignment = .center
            break
        case .right:
            break
        case .left:
            self.textAlignment = .left
            self.sizeToFit()
            break
        }
    }
}

//MARK: UITextField Extension

extension UITextField {
    
    enum AlignmentText {
        case center, rigth, left
    }
    
    func setTextField(fontSize: Int, lblText: String, textColor: UIColor, alingnment : AlignmentText, alpha: CGFloat) {
        
        self.font = self.font?.withSize(CGFloat(fontSize))
        self.textColor  = textColor.withAlphaComponent(alpha)
        self.text = lblText
        
        switch alingnment {
        case .center:
            self.textAlignment = .center
            break
        case .rigth:
            break
        case .left:
            self.textAlignment = .left
            self.sizeToFit()
            break
        }
    }
}

//MARK: UIView Extension

extension UIView {
    
    func dropShadow(){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 1
    }
}

//MARK: UIButton Extension

extension UIButton {
    
    func setButton(titleText : String, backgroundColor : UIColor){
        self.setTitle(titleText, for: .normal)
        self.backgroundColor = backgroundColor
    }
}

//MARK: UITableViewCell Extension

extension UITableViewCell {
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 2
        layer.masksToBounds = false
    }
}

//MARK: UIColor Extension

extension UIColor {
    static let workBlue = UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
    static let workGrey = UIColor(red:0.40, green:0.40, blue:0.40, alpha:1.0)
    static let workSand = UIColor(red:0.90, green:0.88, blue:0.77, alpha:1.0)
}

