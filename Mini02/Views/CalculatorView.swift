
import Foundation
import UIKit

class CalculatorView {
    
    // Seting Global View
    
    var viewGlobal : UIView!
    
    // setting Views
    
    let viewItem = UIView()
    let viewCost = UIView()
    let viewResult = UIView()
    let viewProfit = UIView()
    let viewButton = UIView()
    
    // setting sub views
    
    let viewCostButton = UIView()
    
    // set viewItem objects
    
    let btnVIMaterials = UIButton()
    let lblVIQuantity = UILabel()
    let lblVIQuantityTitle = UILabel()
    let lblVIQUantityTotalMoney = UILabel()
    
    // set viewCost objects
    let btnCostsButton = UIButton()
    let lblVCWorkedHoursTitle = UILabel()
    let lblVCExternalCostsTitle = UILabel()
    let txtVCWorkedHours = UITextField()
    let txtVCExternalCosts = UITextField()
    
    // set viewResult objects
    
    let lblVRTotalTitle = UILabel()
    let lblVRTotalByHourTitle = UILabel()
    let lblVRTotal = UILabel()
    let lblVRTotalByHour = UILabel()
    
    //set viewProfit objects
    
    let lblVPProfitTitle = UILabel()
    let lblVPProfitByHourTitle = UILabel()
    let txtVPProfit = UITextField()
    let lblVPProfitByHour = UILabel()
    
    //set viewButton objects
    
    let btnVBAddProjects = UIButton()
    
    
    func setLayoutInView(view: UIView) {
        setViews(view: view)
    }
    
    func setViews(view : UIView) {
        viewGlobal = UIView(frame: (CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))
        viewGlobal.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        view.addSubview(viewGlobal)
        
        viewGlobal.addSubview(viewItem)
        viewItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 70).isActive = true
        viewItem.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewItem.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewItem.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewItem.layer.cornerRadius = 7
        viewItem.dropShadow()
        viewItem.backgroundColor = .workSand
        
        setViewItemLayout(view: viewItem)
        
        viewGlobal.addSubview(viewCost)
        viewCost.translatesAutoresizingMaskIntoConstraints = false
        viewCost.topAnchor.constraint(equalTo: viewItem.bottomAnchor, constant: 10).isActive = true
        viewCost.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewCost.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewCost.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        viewCost.layer.cornerRadius = 7
        viewCost.backgroundColor = .white
        
        setViewCostLayout(view: viewCost)
        
        viewGlobal.addSubview(viewResult)
        viewResult.translatesAutoresizingMaskIntoConstraints = false
        viewResult.topAnchor.constraint(equalTo: viewCost.bottomAnchor, constant: 10).isActive = true
        viewResult.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewResult.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewResult.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        viewResult.layer.cornerRadius = 7
        viewResult.backgroundColor = .white
        
        setViewResultLayout(view: viewResult)
        
        viewGlobal.addSubview(viewProfit)
        viewProfit.translatesAutoresizingMaskIntoConstraints = false
        viewProfit.topAnchor.constraint(equalTo: viewResult.bottomAnchor, constant: 10).isActive = true
        viewProfit.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewProfit.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewProfit.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        viewProfit.layer.cornerRadius = 7
        viewProfit.backgroundColor = .white
        
        setViewProfitLayout(view: viewProfit)
        
        viewGlobal.addSubview(viewButton)
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.topAnchor.constraint(equalTo: viewProfit.bottomAnchor, constant: 10).isActive = true
        viewButton.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        viewButton.backgroundColor = .clear
        
        setViewButtonLayout(view: viewButton)
        
        
    }
    
    func setViewItemLayout(view : UIView) {
        view.addSubview(btnVIMaterials)
        view.addSubview(lblVIQuantityTitle)
        view.addSubview(lblVIQuantity)
        view.addSubview(lblVIQUantityTotalMoney)
        
        btnVIMaterials.translatesAutoresizingMaskIntoConstraints = false
        btnVIMaterials.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        btnVIMaterials.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        btnVIMaterials.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        btnVIMaterials.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        lblVIQuantity.translatesAutoresizingMaskIntoConstraints = false
        lblVIQuantity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lblVIQuantity.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        
        lblVIQuantity.setLabelWhithConstraints(fontSize: 20,
                                               lblText: "0",
                                               textColor: .black,
                                               alingnment: .left,
                                               alpha: 1)
        
        lblVIQuantityTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVIQuantityTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lblVIQuantityTitle.leftAnchor.constraint(equalTo: lblVIQuantity.rightAnchor, constant: 10).isActive = true
        
        lblVIQuantityTitle.setLabelWhithConstraints(fontSize: 14,
                                                    lblText: "Itens Selecionados",
                                                    textColor: .black,
                                                    alingnment: .left,
                                                    alpha: 0.7)
        
        lblVIQUantityTotalMoney.translatesAutoresizingMaskIntoConstraints = false
        lblVIQUantityTotalMoney.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lblVIQUantityTotalMoney.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        lblVIQUantityTotalMoney.setLabelWhithConstraints(fontSize: 20,
                                                         lblText: "R$ xx,xx",
                                                         textColor: .black,
                                                         alingnment: .center,
                                                         alpha: 0.2)
        
        
    }
    
    func setViewCostLayout(view : UIView) {
        view.addSubview(viewCostButton)
        view.addSubview(btnCostsButton)
        view.addSubview(lblVCWorkedHoursTitle)
        view.addSubview(lblVCExternalCostsTitle)
        view.addSubview(txtVCWorkedHours)
        view.addSubview(txtVCExternalCosts)
        
        viewCostButton.translatesAutoresizingMaskIntoConstraints = false
        viewCostButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewCostButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        viewCostButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        viewCostButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewCostButton.layer.cornerRadius = 7
        viewCostButton.dropShadow()
        viewCostButton.backgroundColor = .workSand
        
        btnCostsButton.translatesAutoresizingMaskIntoConstraints = false
        btnCostsButton.leftAnchor.constraint(equalTo: viewCostButton.leftAnchor, constant: 0).isActive = true
        btnCostsButton.rightAnchor.constraint(equalTo: viewCostButton.rightAnchor, constant: 0).isActive = true
        btnCostsButton.bottomAnchor.constraint(equalTo: viewCostButton.bottomAnchor, constant: 0).isActive = true
        btnCostsButton.topAnchor.constraint(equalTo: viewCostButton.topAnchor, constant: 0).isActive = true
        
        
        lblVCWorkedHoursTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVCWorkedHoursTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblVCWorkedHoursTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        
        lblVCWorkedHoursTitle.setLabelWhithConstraints(fontSize: 13,
                                                       lblText: "Horas Trabalhadas",
                                                       textColor: .black,
                                                       alingnment: .left,
                                                       alpha: 0.5)
        
        lblVCExternalCostsTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVCExternalCostsTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblVCExternalCostsTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        
        lblVCExternalCostsTitle.setLabelWhithConstraints(fontSize: 13,
                                                         lblText: "Custos Externos",
                                                         textColor: .black,
                                                         alingnment: .left,
                                                         alpha: 0.5)
        
        txtVCWorkedHours.translatesAutoresizingMaskIntoConstraints = false
        txtVCWorkedHours.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        txtVCWorkedHours.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        
        txtVCWorkedHours.setTextField(fontSize: 15,
                                      lblText: "X h",
                                      textColor: .workBlue,
                                      alingnment: .center,
                                      alpha: 1)
        
        txtVCExternalCosts.translatesAutoresizingMaskIntoConstraints = false
        txtVCExternalCosts.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12 ).isActive = true
        txtVCExternalCosts.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        
        txtVCExternalCosts.setTextField(fontSize: 15,
                                        lblText: "Y h",
                                        textColor: .workBlue,
                                        alingnment: .center,
                                        alpha: 1)
    }
    
    func setViewResultLayout(view : UIView) {
        view.addSubview(lblVRTotalTitle)
        view.addSubview(lblVRTotalByHourTitle)
        view.addSubview(lblVRTotal)
        view.addSubview(lblVRTotalByHour)
        
        lblVRTotalTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVRTotalTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblVRTotalTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
        lblVRTotalTitle.setLabelWhithConstraints(fontSize: 22,
                                                       lblText: "TOTAL",
                                                       textColor: .black,
                                                       alingnment: .left,
                                                       alpha: 0.5)
        
        lblVRTotalByHourTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVRTotalByHourTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblVRTotalByHourTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        lblVRTotalByHourTitle.setLabelWhithConstraints(fontSize: 16,
                                                         lblText: "TOTAL/HORA",
                                                         textColor: .black,
                                                         alingnment: .left,
                                                         alpha: 0.5)
        
        lblVRTotal.translatesAutoresizingMaskIntoConstraints = false
        lblVRTotal.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        lblVRTotal.topAnchor.constraint(equalTo: view.topAnchor, constant: 28).isActive = true
        
        lblVRTotal.setLabelWhithConstraints(fontSize: 22,
                                            lblText: "R$ xx,xx",
                                            textColor: .black,
                                            alingnment: .center,
                                            alpha: 0.5)
        
        lblVRTotalByHour.translatesAutoresizingMaskIntoConstraints = false
        lblVRTotalByHour.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12 ).isActive = true
        lblVRTotalByHour.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        lblVRTotalByHour.setLabelWhithConstraints(fontSize: 16,
                                                  lblText: "R$ xx,xx/hora",
                                                  textColor: .black,
                                                  alingnment: .center,
                                                  alpha: 0.5)
        
        
    }
    
    func setViewProfitLayout(view : UIView) {
        view.addSubview(lblVPProfitTitle)
        view.addSubview(lblVPProfitByHourTitle)
        view.addSubview(txtVPProfit)
        view.addSubview(lblVPProfitByHour)
        
        lblVPProfitTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVPProfitTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblVPProfitTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
        lblVPProfitTitle.setLabelWhithConstraints(fontSize: 13,
                                                 lblText: "Lucro Pretendido",
                                                 textColor: .black,
                                                 alingnment: .left,
                                                 alpha: 0.5)
        
        lblVPProfitByHourTitle.translatesAutoresizingMaskIntoConstraints = false
        lblVPProfitByHourTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        lblVPProfitByHourTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        lblVPProfitByHourTitle.setLabelWhithConstraints(fontSize: 16,
                                                       lblText: "LUCRO/HORA",
                                                       textColor: .black,
                                                       alingnment: .left,
                                                       alpha: 0.5)
        
        txtVPProfit.translatesAutoresizingMaskIntoConstraints = false
        txtVPProfit.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        txtVPProfit.topAnchor.constraint(equalTo: view.topAnchor, constant: 28).isActive = true
        
        txtVPProfit.setTextField(fontSize: 15,
                                lblText: "$Y",
                                textColor: .workBlue,
                                alingnment: .center,
                                alpha: 1)
        
        lblVPProfitByHour.translatesAutoresizingMaskIntoConstraints = false
        lblVPProfitByHour.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12 ).isActive = true
        lblVPProfitByHour.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        lblVPProfitByHour.setLabelWhithConstraints(fontSize: 16,
                                                  lblText: "R$ xx,xx/hora",
                                                  textColor: .black,
                                                  alingnment: .center,
                                                  alpha: 0.5)
        
    }
    
    func setViewButtonLayout(view : UIView) {
        view.addSubview(btnVBAddProjects)
        
        btnVBAddProjects.translatesAutoresizingMaskIntoConstraints = false
        btnVBAddProjects.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnVBAddProjects.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btnVBAddProjects.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btnVBAddProjects.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        
        btnVBAddProjects.layer.cornerRadius = 7
        btnVBAddProjects.backgroundColor = .workBlue
        btnVBAddProjects.setTitle("Add to my projects", for: .normal)
    }
    

}
