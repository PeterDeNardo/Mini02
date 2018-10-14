
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
    let viewCFFrequency = UIView()
    let viewCFDaysWorked = UIView()
    
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
    let lblCFFrequency = UILabel()
    let lblCFDaysWOrk = UILabel()
    let txtCFFrequency = UITextField()
    let txtCFDaysWork = UITextField()
    
    //viewCPTitle
    let lblCPBTitle = UILabel()
    //viewCPBody
    let lblCPBTotal = UILabel()
    let txtCPBTotal = UITextField()
    
    //viewEFTile
    let lblEFTitle = UILabel()
    //viewEFBody
    let lblEFTotal = UILabel()
    let lblEFTotalByHour = UILabel()
    let lblEFTotalResult = UILabel()
    let lblEFTotalByHourResult = UILabel()

    //MARK: setView function
    func setViews() -> UIView{
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewGlobal.backgroundColor = UIColor(red:0.90, green:0.88, blue:0.77, alpha:1.0)
        
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
        viewCostsPunctual.heightAnchor.constraint(equalToConstant: 86).isActive = true
        viewCostsPunctual.backgroundColor = .clear
        
        viewGlobal.addSubview(viewExpensesFixed)
        viewExpensesFixed.translatesAutoresizingMaskIntoConstraints = false
        viewExpensesFixed.topAnchor.constraint(equalTo: viewCostsPunctual.bottomAnchor, constant: 10).isActive = true
        viewExpensesFixed.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewExpensesFixed.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewExpensesFixed.heightAnchor.constraint(equalToConstant: 146).isActive = true
        viewExpensesFixed.backgroundColor = .clear
        
        
        //SubViews
        //CFView
        
        viewCostsFixed.addSubview(viewCFTitle)
        viewCFTitle.translatesAutoresizingMaskIntoConstraints = false
        viewCFTitle.topAnchor.constraint(equalTo: viewCostsFixed.topAnchor, constant: 0).isActive = true
        viewCFTitle.leftAnchor.constraint(equalTo: viewCostsFixed.leftAnchor, constant: 0).isActive = true
        viewCFTitle.rightAnchor.constraint(equalTo: viewCostsFixed.rightAnchor, constant: 0).isActive = true
        viewCFTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewCFTitle.backgroundColor = .clear
        
        viewCostsFixed.addSubview(viewCFFrequency)
        viewCFFrequency.translatesAutoresizingMaskIntoConstraints = false
        viewCFFrequency.topAnchor.constraint(equalTo: viewCFTitle.bottomAnchor, constant: 0).isActive = true
        viewCFFrequency.leftAnchor.constraint(equalTo: viewCostsFixed.leftAnchor, constant: 0).isActive = true
        viewCFFrequency.rightAnchor.constraint(equalTo: viewCostsFixed.rightAnchor, constant: 0).isActive = true
        viewCFFrequency.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        viewCFFrequency.layer.cornerRadius = 7
        viewCFFrequency.backgroundColor = .white
        
        viewCostsFixed.addSubview(viewCFDaysWorked)
        viewCFDaysWorked.translatesAutoresizingMaskIntoConstraints = false
        viewCFDaysWorked.topAnchor.constraint(equalTo: viewCFFrequency.bottomAnchor, constant: 6).isActive = true
        viewCFDaysWorked.leftAnchor.constraint(equalTo: viewCostsFixed.leftAnchor, constant: 0).isActive = true
        viewCFDaysWorked.rightAnchor.constraint(equalTo: viewCostsFixed.rightAnchor, constant: 0).isActive = true
        viewCFDaysWorked.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        viewCFDaysWorked.layer.cornerRadius = 7
        viewCFDaysWorked.backgroundColor = .white
        
        setViewCostFixed()
        
        //CPView
        
        viewCostsPunctual.addSubview(viewCPTitle)
        viewCPTitle.translatesAutoresizingMaskIntoConstraints = false
        viewCPTitle.topAnchor.constraint(equalTo: viewCostsPunctual.topAnchor, constant: 0).isActive = true
        viewCPTitle.leftAnchor.constraint(equalTo: viewCostsPunctual.leftAnchor, constant: 0).isActive = true
        viewCPTitle.rightAnchor.constraint(equalTo: viewCostsPunctual.rightAnchor, constant: 0).isActive = true
        viewCPTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewCPTitle.backgroundColor = .clear
        
        viewCostsPunctual.addSubview(viewCPBody)
        viewCPBody.translatesAutoresizingMaskIntoConstraints = false
        viewCPBody.topAnchor.constraint(equalTo: viewCPTitle.bottomAnchor, constant: 0).isActive = true
        viewCPBody.leftAnchor.constraint(equalTo: viewCostsPunctual.leftAnchor, constant: 0).isActive = true
        viewCPBody.rightAnchor.constraint(equalTo: viewCostsPunctual.rightAnchor, constant: 0).isActive = true
        viewCPBody.bottomAnchor.constraint(equalTo: viewCostsPunctual.bottomAnchor, constant: 0).isActive = true
        
        viewCPBody.layer.cornerRadius = 7
        viewCPBody.backgroundColor = .white
        
        setViewCustPunctual()
        
        //EFView
        
        viewExpensesFixed.addSubview(viewEFTitle)
        viewEFTitle.translatesAutoresizingMaskIntoConstraints = false
        viewEFTitle.topAnchor.constraint(equalTo: viewExpensesFixed.topAnchor, constant: 0).isActive = true
        viewEFTitle.leftAnchor.constraint(equalTo: viewExpensesFixed.leftAnchor, constant: 0).isActive = true
        viewEFTitle.rightAnchor.constraint(equalTo: viewExpensesFixed.rightAnchor, constant: 0).isActive = true
        viewEFTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewEFTitle.backgroundColor = .clear
        
        viewExpensesFixed.addSubview(viewEFBody)
        viewEFBody.translatesAutoresizingMaskIntoConstraints = false
        viewEFBody.topAnchor.constraint(equalTo: viewEFTitle.bottomAnchor, constant: 0).isActive = true
        viewEFBody.leftAnchor.constraint(equalTo: viewExpensesFixed.leftAnchor, constant: 0).isActive = true
        viewEFBody.rightAnchor.constraint(equalTo: viewExpensesFixed.rightAnchor, constant: 0).isActive = true
        viewEFBody.bottomAnchor.constraint(equalTo: viewExpensesFixed.bottomAnchor, constant: 0).isActive = true
        
        viewEFBody.layer.cornerRadius = 7
        viewEFBody.backgroundColor = .white
        
        setViewExpensesFixed()
        
        return viewGlobal
    }
    
    
    //MARK: Adding objects in respective Views
    
    func setViewCostFixed() {
        
        //Setting CFTitle
        
        lblCFTTitle.frame = CGRect(x: 35, y: 15, width: 169, height: 26)
        lblCFTTitle.setLabelWhithConstraints(fontSize: 14,
                                             lblText: "Custos Fixos",
                                             textColor: .black,
                                             alingnment: .left,
                                             alpha: 0.8)
        viewCFTitle.addSubview(lblCFTTitle)
        
        
        //Set CFFrequency
        
        lblCFFrequency.frame = CGRect(x: 15, y: 13, width: 74, height: 16)
        lblCFFrequency.setLabelWhithConstraints(fontSize: 14,
                                                lblText: "Frequência",
                                                textColor: .black,
                                                alingnment: .left,
                                                alpha: 0.6)
        viewCFFrequency.addSubview(lblCFFrequency)
        
        txtCFFrequency.frame = CGRect(x: 235, y: 12, width: 61, height: 21)
        txtCFFrequency.setTextField(fontSize: 18,
                                    lblText: "Mensal",
                                    textColor: .workBlue,
                                    alingnment: .rigth,
                                    alpha: 1)
        viewCFFrequency.addSubview(txtCFFrequency)
        
        
        //Set CFDaysWorked
        
        lblCFDaysWOrk.frame = CGRect(x: 15, y: 13, width: 175, height: 15)
        lblCFDaysWOrk.setLabelWhithConstraints(fontSize: 12,
                                               lblText: "Dias trabalhados na semana",
                                               textColor: .black,
                                               alingnment: .left,
                                               alpha: 0.6)
        viewCFDaysWorked.addSubview(lblCFDaysWOrk)
        
        txtCFDaysWork.frame = CGRect(x: 235, y: 12, width: 61, height: 21)
        txtCFDaysWork.setTextField(fontSize: 16,
                                   lblText: "4",
                                   textColor: .workBlue,
                                   alingnment: .rigth,
                                   alpha: 1)
        viewCFDaysWorked.addSubview(txtCFDaysWork)
        
    }
    
    func setViewCustPunctual() {
        
        //Setting CPTitle
        
        lblCPBTitle.frame = CGRect(x: 35, y: 15, width: 169, height: 16)
        lblCPBTitle.setLabelWhithConstraints(fontSize: 14,
                                             lblText: "Custos Pontuais",
                                             textColor: .black,
                                             alingnment: .left,
                                             alpha: 0.8)
        viewCPTitle.addSubview(lblCPBTitle)
        
        //Setting CPBody
        
        lblCPBTotal.frame = CGRect(x: 15, y: 13, width: 29, height: 15)
        lblCPBTotal.setLabelWhithConstraints(fontSize: 12,
                                             lblText: "Total",
                                             textColor: .black,
                                             alingnment: .left,
                                             alpha: 0.6)
        viewCPBody.addSubview(lblCPBTotal)
        
        txtCPBTotal.frame = CGRect(x: 235, y: 12, width: 61, height: 21)
        txtCPBTotal.setTextField(fontSize: 16,
                                 lblText: "$Y" ,
                                 textColor: .blue,
                                 alingnment: .rigth, alpha: 1)
        viewCPBody.addSubview(txtCPBTotal)
    }
    
    func setViewExpensesFixed() {
        
        //Setting Title
        lblEFTitle.frame = CGRect(x: 35, y: 15, width: 169, height: 16)
        lblEFTitle.setLabelWhithConstraints(fontSize: 14,
                                             lblText: "Valor despensas fixas",
                                             textColor: .black,
                                             alingnment: .left,
                                             alpha: 0.8)
        viewEFTitle.addSubview(lblEFTitle)
        
        //Setting Body
        
        lblEFTotal.frame = CGRect(x: 13, y: 11, width: 76, height: 29)
        lblEFTotal.setLabelWhithConstraints(fontSize: 24,
                                            lblText: "TOTAL",
                                            textColor: .black,
                                            alingnment: .left,
                                            alpha: 0.4)
        viewEFBody.addSubview(lblEFTotal)
        
        lblEFTotalByHour.frame = CGRect(x: 13, y: 64, width: 102, height: 19)
        lblEFTotalByHour.setLabelWhithConstraints(fontSize: 16,
                                                  lblText: "TOTAL/HORA",
                                                  textColor: .black,
                                                  alingnment: .left,
                                                  alpha: 0.4)
        viewEFBody.addSubview(lblEFTotalByHour)
        
        lblEFTotalResult.frame = CGRect(x: 250, y: 11, width: 46, height: 29)
        lblEFTotalResult.setLabelWhithConstraints(fontSize: 24,
                                                  lblText: "R$Y",
                                                  textColor: .black,
                                                  alingnment: .left,
                                                  alpha: 0.4)
        viewEFBody.addSubview(lblEFTotalResult)
        
        lblEFTotalByHourResult.frame = CGRect(x: 180, y: 62, width: 304, height: 100)
        lblEFTotalByHourResult.setLabelWhithConstraints(fontSize: 18,
                                                        lblText: "R$ xx,xx /hora",
                                                        textColor: .black,
                                                        alingnment: .left,
                                                        alpha: 0.4)
        viewEFBody.addSubview(lblEFTotalByHourResult)
    }
    
    
    
    
}
