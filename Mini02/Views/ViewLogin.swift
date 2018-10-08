
import Foundation
import UIKit

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
        viewLoginFbButton.backgroundColor = .black
        
        
        viewLoginFbButton.addSubview(nome)
        
        
        nome.translatesAutoresizingMaskIntoConstraints = false
        nome.topAnchor.constraint(equalTo: viewLoginFbButton.topAnchor, constant: 0).isActive = true
        nome.bottomAnchor.constraint(equalTo: viewLoginFbButton.bottomAnchor, constant: 0).isActive = true
        nome.leftAnchor.constraint(equalTo: viewLoginFbButton.leftAnchor, constant: 0).isActive = true
        nome.rightAnchor.constraint(equalTo: viewLoginFbButton.rightAnchor, constant: 0)
        
        nome.setLabelWhithConstraints(fontSize: 14,
                                      lblText: "teste",
                                      textColor: .white,
                                      alingnment: .center,
                                      alpha: 1)
    }
}
