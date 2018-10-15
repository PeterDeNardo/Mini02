
import Foundation
import UIKit

class CalculatorPlussView {
    
    //MARK: Setting objects in screen
    //Setting Global View
    
    var viewGlobal : UIView!
    
    
    //Setting Views
    
    let viewTimeExpend = UIView()
    let viewCostsFixed = UIView()
    let viewCostsPunctual = UIView()
    let viewCostExpenses = UIView()
    
    
    //Setting SubViews
    
    //Setting viewCostsFixed SubViews
    
    let viewTETitle = UIView()
    let ViewTEInfo = UIView()
    
    //Setting ViewCFInfo SubViews
    
    let viewTEIDuration = UIView()
    let viewTEIDaysWorked = UIView()
    let viewTEIHourByDay = UIView()
    
    //Setting viewCostsPunctual SubViews
    
    let viewCPTitle = UIView()
    let viewCPBody = UIView()
    
    //Setting viewExpensesFixed SubViews
    
    let viewEFTitle = UIView()
    let viewEFBody = UIView()
    
    
    //Setting Objects inside of views
    
    //viewCFTitle
    let lblTETitle = UILabel()
    //viewCFBody
    let lblTEDuration = UILabel()
    let lblTEDaysWork = UILabel()
    let lblTETimeWork = UILabel()
    let txtTEDuration = UITextField()
    let txtTEDaysWork = UITextField()
    let txtTETimeWork = UITextField()
    
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
        
        viewGlobal.addSubview(viewTimeExpend)
        viewTimeExpend.translatesAutoresizingMaskIntoConstraints = false
        viewTimeExpend.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 70).isActive = true
        viewTimeExpend.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewTimeExpend.widthAnchor.constraint(equalToConstant: 338).isActive = true
        viewTimeExpend.heightAnchor.constraint(equalToConstant: 186).isActive = true
        
        viewTimeExpend.layer.cornerRadius = 7
        viewTimeExpend.backgroundColor = .clear
        
        viewGlobal.addSubview(viewCostsFixed)
        viewCostsFixed.translatesAutoresizingMaskIntoConstraints = false
        viewCostsFixed.topAnchor.constraint(equalTo: viewCostsFixed.bottomAnchor, constant: 10).isActive = true
        viewCostsFixed.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewCostsFixed.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewCostsFixed.heightAnchor.constraint(equalToConstant: 86).isActive = true
        viewCostsFixed.backgroundColor = .clear
        
        viewGlobal.addSubview(viewCostsPunctual)
        viewCostsPunctual.translatesAutoresizingMaskIntoConstraints = false
        viewCostsPunctual.topAnchor.constraint(equalTo: viewCostsFixed.bottomAnchor, constant: 10).isActive = true
        viewCostsPunctual.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewCostsPunctual.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewCostsPunctual.heightAnchor.constraint(equalToConstant: 146).isActive = true
        viewCostsPunctual.backgroundColor = .clear
    
        
        
        //SubViews
        //CFView
        
        viewTimeExpend.addSubview(viewTETitle)
        viewTETitle.translatesAutoresizingMaskIntoConstraints = false
        viewTETitle.topAnchor.constraint(equalTo: viewTimeExpend.topAnchor, constant: 0).isActive = true
        viewTETitle.leftAnchor.constraint(equalTo: viewTimeExpend.leftAnchor, constant: 0).isActive = true
        viewTETitle.rightAnchor.constraint(equalTo: viewTimeExpend.rightAnchor, constant: 0).isActive = true
        viewTETitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        viewTimeExpend.addSubview(ViewTEInfo)
        ViewTEInfo.translatesAutoresizingMaskIntoConstraints = false
        ViewTEInfo.topAnchor.constraint(equalTo: viewTETitle.bottomAnchor, constant: 0).isActive = true
        ViewTEInfo.leftAnchor.constraint(equalTo: viewTimeExpend.leftAnchor, constant: 0).isActive = true
        ViewTEInfo.rightAnchor.constraint(equalTo: viewTimeExpend.rightAnchor, constant: 0).isActive = true
        ViewTEInfo.bottomAnchor.constraint(equalTo: viewTimeExpend.bottomAnchor, constant: 0).isActive = true
        ViewTEInfo.layer.cornerRadius = 7
        ViewTEInfo.backgroundColor = .white
        
        ViewTEInfo.addSubview(viewTEIDuration)
        viewTEIDuration.translatesAutoresizingMaskIntoConstraints = false
        viewTEIDuration.topAnchor.constraint(equalTo: ViewTEInfo.topAnchor, constant: 0).isActive = true
        viewTEIDuration.leftAnchor.constraint(equalTo: ViewTEInfo.leftAnchor, constant: 0).isActive = true
        viewTEIDuration.rightAnchor.constraint(equalTo: ViewTEInfo.rightAnchor, constant: 0).isActive = true
        viewTEIDuration.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        ViewTEInfo.addSubview(viewTEIDaysWorked)
        viewTEIDaysWorked.translatesAutoresizingMaskIntoConstraints = false
        viewTEIDaysWorked.topAnchor.constraint(equalTo: viewTEIDuration.bottomAnchor, constant: 0).isActive = true
        viewTEIDaysWorked.leftAnchor.constraint(equalTo: ViewTEInfo.leftAnchor, constant: 0).isActive = true
        viewTEIDaysWorked.rightAnchor.constraint(equalTo: ViewTEInfo.rightAnchor, constant: 0).isActive = true
        viewTEIDaysWorked.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        ViewTEInfo.addSubview(viewTEIHourByDay)
        viewTEIHourByDay.translatesAutoresizingMaskIntoConstraints = false
        viewTEIHourByDay.topAnchor.constraint(equalTo: viewTEIDaysWorked.bottomAnchor, constant: 0).isActive = true
        viewTEIHourByDay.leftAnchor.constraint(equalTo: ViewTEInfo.leftAnchor, constant: 0).isActive = true
        viewTEIHourByDay.rightAnchor.constraint(equalTo: ViewTEInfo.rightAnchor, constant: 0).isActive = true
        viewTEIHourByDay.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        
        setViewTimeExpend()
        
        //CFView
        
        viewCostsFixed.addSubview(viewCF)
        
        //CPView
//
//        viewCostsPunctual.addSubview(viewCPTitle)
//        viewCPTitle.translatesAutoresizingMaskIntoConstraints = false
//        viewCPTitle.topAnchor.constraint(equalTo: viewCostsPunctual.topAnchor, constant: 0).isActive = true
//        viewCPTitle.leftAnchor.constraint(equalTo: viewCostsPunctual.leftAnchor, constant: 0).isActive = true
//        viewCPTitle.rightAnchor.constraint(equalTo: viewCostsPunctual.rightAnchor, constant: 0).isActive = true
//        viewCPTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        viewCPTitle.backgroundColor = .clear
//
//        viewCostsPunctual.addSubview(viewCPBody)
//        viewCPBody.translatesAutoresizingMaskIntoConstraints = false
//        viewCPBody.topAnchor.constraint(equalTo: viewCPTitle.bottomAnchor, constant: 0).isActive = true
//        viewCPBody.leftAnchor.constraint(equalTo: viewCostsPunctual.leftAnchor, constant: 0).isActive = true
//        viewCPBody.rightAnchor.constraint(equalTo: viewCostsPunctual.rightAnchor, constant: 0).isActive = true
//        viewCPBody.bottomAnchor.constraint(equalTo: viewCostsPunctual.bottomAnchor, constant: 0).isActive = true
//
//        viewCPBody.layer.cornerRadius = 7
//        viewCPBody.backgroundColor = .white
//
//        setViewCustPunctual()
        
        //EFView
        
//        viewExpensesFixed.addSubview(viewEFTitle)
//        viewEFTitle.translatesAutoresizingMaskIntoConstraints = false
//        viewEFTitle.topAnchor.constraint(equalTo: viewExpensesFixed.topAnchor, constant: 0).isActive = true
//        viewEFTitle.leftAnchor.constraint(equalTo: viewExpensesFixed.leftAnchor, constant: 0).isActive = true
//        viewEFTitle.rightAnchor.constraint(equalTo: viewExpensesFixed.rightAnchor, constant: 0).isActive = true
//        viewEFTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        viewEFTitle.backgroundColor = .clear
//
//        viewExpensesFixed.addSubview(viewEFBody)
//        viewEFBody.translatesAutoresizingMaskIntoConstraints = false
//        viewEFBody.topAnchor.constraint(equalTo: viewEFTitle.bottomAnchor, constant: 0).isActive = true
//        viewEFBody.leftAnchor.constraint(equalTo: viewExpensesFixed.leftAnchor, constant: 0).isActive = true
//        viewEFBody.rightAnchor.constraint(equalTo: viewExpensesFixed.rightAnchor, constant: 0).isActive = true
//        viewEFBody.bottomAnchor.constraint(equalTo: viewExpensesFixed.bottomAnchor, constant: 0).isActive = true
        
//        viewEFBody.layer.cornerRadius = 7
//        viewEFBody.backgroundColor = .white
        
//        setViewExpensesFixed()
        
        return viewGlobal
    }
    
    
    //MARK: Adding objects in respective Views
    
    func setViewTimeExpend() {
        
        //Setting CFTitle
        
        lblTETitle.frame = CGRect(x: 35, y: 15, width: 169, height: 26)
        lblTETitle.setLabelWhithConstraints(fontSize: 14,
                                             lblText: "Tempo Gasto",
                                             textColor: .black,
                                             alingnment: .left,
                                             alpha: 0.8)
        viewTETitle.addSubview(lblTETitle)
        
        
        //Set CFFrequency
        
        lblTEDuration.frame = CGRect(x: 15, y: 13, width: 74, height: 16)
        lblTEDuration.setLabelWhithConstraints(fontSize: 14,
                                                lblText: "Duração",
                                                textColor: .black,
                                                alingnment: .left,
                                                alpha: 0.6)
        viewTEIDuration.addSubview(lblTEDuration)
        
        txtTEDuration.frame = CGRect(x: 235, y: 12, width: 95, height: 21)
        txtTEDuration.setTextField(fontSize: 18,
                                    lblText: "1 Semana",
                                    textColor: .workBlue,
                                    alingnment: .rigth,
                                    alpha: 1)
        viewTEIDuration.addSubview(txtTEDuration)
        
        
        //Set CFDaysWorked
        
        lblTEDaysWork.frame = CGRect(x: 15, y: 13, width: 175, height: 15)
        lblTEDaysWork.setLabelWhithConstraints(fontSize: 12,
                                               lblText: "Dias trabalhados na semana",
                                               textColor: .black,
                                               alingnment: .left,
                                               alpha: 0.6)
        viewTEIDaysWorked.addSubview(lblTEDaysWork)
        
        txtTEDaysWork.frame = CGRect(x: 235, y: 12, width: 61, height: 21)
        txtTEDaysWork.setTextField(fontSize: 18,
                                   lblText: "4",
                                   textColor: .workBlue,
                                   alingnment: .rigth,
                                   alpha: 1)
        viewTEIDaysWorked.addSubview(txtTEDaysWork)
        
        lblTETimeWork.frame = CGRect(x: 15, y: 13, width: 175, height: 15)
        lblTETimeWork.setLabelWhithConstraints(fontSize: 14,
                                               lblText: "Horas Ttrabalhadas/dia",
                                               textColor: .black,
                                               alingnment: .left,
                                               alpha: 0.6)
        viewTEIHourByDay.addSubview(lblTETimeWork)

        txtTETimeWork.frame = CGRect(x: 235, y: 13, width: 175, height: 15)
        txtTETimeWork.setTextField(fontSize: 18,
                                   lblText: "4 h",
                                   textColor: .workBlue,
                                   alingnment: .rigth,
                                   alpha: 1)
        viewTEIHourByDay.addSubview(txtTETimeWork)

        
        
        
        
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
