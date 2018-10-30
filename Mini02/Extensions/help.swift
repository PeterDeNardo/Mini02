
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
    
    open var isSelectedNow : Bool {
            get {
                return self.isSelected
            }
            set(newValue) {
                self.isSelected = newValue
            }
    }
    
    enum FontType {
        case one, two, three
    }
    
    enum AlignmentText {
        case center, rigth, left
    }
    
    enum keyboardType {
        case mail, URL, phone, numberPad, ignore
    }
    
    func setTextField(fontType: FontType ,fontSize: Int, lblText: String, textColor: UIColor, alingnment : AlignmentText, alpha: CGFloat, ifHaveImageName : String, keyboardType : keyboardType) {
        
//        let scale : CGFloat = 0.0
//        let size = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.bounds.width, height: self.bounds.height), false, scale)
//        image?.draw(in: size)
//        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        self.textColor  = textColor.withAlphaComponent(alpha)
        self.text = lblText
        //self.backgroundColor = UIColor.init(patternImage: scaledImage!)
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.rightViewMode = .always
        self.leftViewMode = .always
        
        if ifHaveImageName != "NoHaveImage" {
            let image = UIImage(named: ifHaveImageName)
            self.background = image
        }
        
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
        
        switch keyboardType {
        case .mail:
            self.keyboardType = .emailAddress
            break
        case .numberPad:
            self.keyboardType = .numberPad
            break
        case .phone:
            self.keyboardType = .phonePad
            break
        case .URL:
            self.keyboardType = .URL
            break
        case .ignore:
            self.keyboardType = .default
            break
       
        }
        
    }
    
    func visibleStatusOfBackgroundImage(image : UIImage, hide: Bool ) {
        if hide{
            self.background = UIImage()
        } else {
            self.background = image
        }
    }
}

//MARK: UIView Extension

extension UIView {
    
    func dropShadow(shadowRadius : CGFloat, shadowOffsetX : CGFloat, shadowOffsetY : CGFloat){
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: shadowOffsetX, height: shadowOffsetY)
        layer.shadowRadius = shadowRadius
    }
}

//MARK: UIButton Extension

extension UIButton {
    
    func setButton(titleText : String, backgroundColor : UIColor, backgroundImageIfSelected : UIImage, backgroundImageIfDiselected : UIImage){
        self.setImage(backgroundImageIfSelected, for: .selected)
        self.setImage(backgroundImageIfDiselected, for: .normal)
        self.imageView?.contentMode = .scaleAspectFill
        
        if (titleText != "NoUseTitle"){
            self.setTitle(titleText, for: .normal)
        } 
    
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
