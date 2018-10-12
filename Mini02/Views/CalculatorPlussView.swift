
import Foundation
import UIKit

class CalculatorPlussView {
    
    //MARK: Setting objects in screen
    //Setting Global View
    
    var viewGlobal : UIView!
    
    
    //Setting Views
    
    let viewCostsFixed = UIView()
    let viewCostsPunctual = UIView()
    let viewExpensesFixed = UIView()
    
    
    //Setting SubViews
    
    //Setting viewCostsFixed SubViews
    
    let viewCFTitle = UIView()
    let viewCFBody = UIView()
    
    //Setting viewCostsPunctual SubViews
    
    let viewCPTitle = UIView()
    let viewCPBody = UIView()
    
    //Setting viewExpensesFixed SubViews
    
    let viewEFTitle = UIView()
    let viewEFBody = UIView()
    
    
    //Setting Objects inside of views
    
    //viewCFTitle
    let lblCFTTitle = UILabel()
    //viewCFBody
    let lblCFBFrequency = UILabel()
    let lblCFBValue = UILabel()
    let lblCFBDaysWOrk = UILabel()
    let txtCFBFrequency = UITextField()
    let txtCFBValue = UITextField()
    let txtCFBDaysWork = UITextField()
    
    //viewCPTitle
    let lblCPBTitle = UILabel()
    //viewCPBody
    let lblCPBTotal = UILabel()
    let lblCPBToralMoney = UITextField()
    
    //viewEFTile
    let lblEFTitle = UILabel()
    //viewEFBody
    let lblEFTotalTitle = UILabel()
    let lblEFTotalByHourTitle = UILabel()
    let lblEFTotal = UILabel()
    let lblEFTotalByHour = UILabel()
    
    func setLayoutInView(view: UIView) {
        setViews(view: view)
    }
    
    func setViews(view : UIView) {
        viewGlobal = UIView(frame: (CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))
        viewGlobal.backgroundColor = .yellow
        view.addSubview(viewGlobal)
        
        viewGlobal.addSubview(viewCostsFixed)
        viewCostsFixed.translatesAutoresizingMaskIntoConstraints = false
        viewCostsFixed.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 70).isActive = true
        viewCostsFixed.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewCostsFixed.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewCostsFixed.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        viewCostsFixed.layer.cornerRadius = 7
        viewCostsFixed.backgroundColor = .clear
        
        viewGlobal.addSubview(viewCostsPunctual)
        viewCostsPunctual.translatesAutoresizingMaskIntoConstraints = false
        viewCostsPunctual.topAnchor.constraint(equalTo: viewCostsFixed.bottomAnchor, constant: 10).isActive = true
        viewCostsPunctual.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewCostsPunctual.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewCostsPunctual.heightAnchor.constraint(equalToConstant: 70).isActive = true
        viewCostsPunctual.backgroundColor = .white
        
        viewGlobal.addSubview(viewExpensesFixed)
        viewExpensesFixed.translatesAutoresizingMaskIntoConstraints = false
        viewExpensesFixed.topAnchor.constraint(equalTo: viewCostsPunctual.bottomAnchor, constant: 10).isActive = true
        viewExpensesFixed.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewExpensesFixed.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewExpensesFixed.heightAnchor.constraint(equalToConstant: 140).isActive = true
        viewExpensesFixed.backgroundColor = .white
        
        
        //SubViews
        //CFView
        
        viewCostsFixed.addSubview(viewCFTitle)
        viewCFTitle.translatesAutoresizingMaskIntoConstraints = false
        viewCFTitle.topAnchor.constraint(equalTo: viewCostsFixed.topAnchor, constant: 0).isActive = true
        viewCFTitle.leftAnchor.constraint(equalTo: viewCostsFixed.leftAnchor, constant: 0).isActive = true
        viewCFTitle.rightAnchor.constraint(equalTo: viewCostsFixed.rightAnchor, constant: 0).isActive = true
        viewCFTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        viewCFTitle.backgroundColor = .clear
        
        viewCostsFixed.addSubview(viewCFBody)
        viewCFBody.translatesAutoresizingMaskIntoConstraints = false
        viewCFBody.topAnchor.constraint(equalTo: viewCFTitle.bottomAnchor, constant: 0).isActive = true
        viewCFBody.bottomAnchor.constraint(equalTo: viewCostsFixed.bottomAnchor, constant: 0).isActive = true
        viewCFBody.leftAnchor.constraint(equalTo: viewCostsFixed.leftAnchor, constant: 0).isActive = true
        viewCFBody.rightAnchor.constraint(equalTo: viewCostsFixed.rightAnchor, constant: 0).isActive = true
        
        viewCFBody.layer.cornerRadius = 7
        viewCFBody.backgroundColor = .white
        
        //CPView
        
        viewCostsPunctual.addSubview(viewCPTitle)
        viewCPTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    
    
}
