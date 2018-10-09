
import Foundation
import UIKit
import Firebase
import FirebaseUI
import FBSDKLoginKit
import GoogleSignIn
import FirebaseAuth


class ViewLogin {

    
    
    //Setting View
    
    var viewGlobal : UIView!
    
    //Setting SubViews
    
    let viewLoginFbButton = UIView()
    
    //Setting Objects
    //viewGlobal
    let nome = UILabel()
    
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
        viewLoginFbButton.layer.cornerRadius = 10
        viewLoginFbButton.clipsToBounds = true
        viewLoginFbButton.dropShadow()
        viewLoginFbButton.backgroundColor = .white
        

    }
    
    func set (button : FBSDKLoginButton, view : UIView) -> FBSDKLoginButton {
        viewLoginFbButton.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: viewLoginFbButton.topAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: viewLoginFbButton.bottomAnchor, constant: 0).isActive = true
        button.leftAnchor.constraint(equalTo: viewLoginFbButton.leftAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: viewLoginFbButton.rightAnchor, constant: 0).isActive = true
        button.layer.cornerRadius = 5
        return button
    }
}
