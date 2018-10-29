
import Foundation
import UIKit

//MARK: UILabel Extension

extension UILabel {
    
    enum AlignmentText {
        case center, right, left
    }
    
    enum FontType {
        case one, two, three
    }
    //MARK: set Label
    //Set all label states without affect the constraints
    func setLabelWhithConstraints(fontType: FontType, fontSize: Int, lblText: String, textColor: UIColor, alingnment : AlignmentText, alpha: CGFloat) {
        
        //lblInfomonth.font =  UIFont(name: "", size: 10)
        self.textColor = textColor.withAlphaComponent(alpha)
        self.text = lblText
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 2
        
        switch fontType {
        case .one:
            self.font = UIFont(name: "SFProText-Regular", size: CGFloat(fontSize))
            break
        case .two:
            self.font = UIFont(name: "SFProText-Medium", size: CGFloat(fontSize))
            break
        case .three:
            self.font = UIFont(name: "SFProText-Bold", size: CGFloat(fontSize))
            break
        }
        
        switch alingnment {
        case .center:
            self.textAlignment = .center
            break
        case .right:
            self.textAlignment = .right
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
    
    enum FontType {
        case one, two, three
    }
    
    enum AlignmentText {
        case center, rigth, left
    }
    
    func setTextField(fontType: FontType ,fontSize: Int, lblText: String, textColor: UIColor, alingnment : AlignmentText, alpha: CGFloat) {
        
        let image = UIImage(named: "textbox")
        let scale : CGFloat = 0.0
        let size = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.bounds.width, height: self.bounds.height), false, scale)
        image?.draw(in: size)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        self.textColor  = textColor.withAlphaComponent(alpha)
        self.text = lblText
        self.backgroundColor = UIColor.init(patternImage: scaledImage!)
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.rightViewMode = .always
        self.leftViewMode = .always
        
        switch fontType {
        case .one:
            self.font = UIFont(name: "SF-Pro-Text--Regular", size: CGFloat(fontSize))
            break
        case .two:
            self.font = UIFont(name: "SF-Pro-Text-Medium", size: CGFloat(fontSize))
            break
        case .three:
            self.font = UIFont(name: "SF-Pro-Text-Bold", size: CGFloat(fontSize))
            break
        }
        
        switch alingnment {
        case .center:
            self.textAlignment = .center
            break
        case .rigth:
            self.textAlignment = .right
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
    static let workBlack = UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0)
    static let workGreen = UIColor(red:0.22, green:0.71, blue:0.29, alpha:1.0)
}


//MARK: UIImage Extension

extension UIImageView {
    
    func setImage(image: UIImage) {
        
        self.image = UIImage(named: "")
        
    }
}
