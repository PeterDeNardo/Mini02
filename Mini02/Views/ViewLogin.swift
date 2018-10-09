
import Foundation
import UIKit

class ViewLogin {
    
    //Setting Global View
    
    var viewGlobal : UIView!
    
    //Setting views
    
    let viewLoginFbButton = UIView()
    
    
    func setLayoutInView(view: UIView) {
        setViews(view: view)
    }
    
    func setViews(view : UIView) {
        viewGlobal = UIView(frame: (CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))
        viewGlobal.backgroundColor = .yellow
        view.addSubview(viewGlobal)
        
        viewGlobal.addSubview(viewLoginFbButton)
        viewLoginFbButton.translatesAutoresizingMaskIntoConstraints = false
        viewLoginFbButton.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewLoginFbButton.centerYAnchor.constraint(equalTo: viewGlobal.centerYAnchor).isActive = true
        viewLoginFbButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewLoginFbButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewLoginFbButton.backgroundColor = .black
        
        
        
    }
}
