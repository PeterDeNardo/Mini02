
import Foundation
import UIKit

class CalculatorView {
    
    // Seting Global View
    
    var viewGlobal : UIView!
    
    // setting Views
    
    let viewNavigationSafeArea = UIView()
    let viewAplication = UIView()
    let viewItem = UIView()
    let viewInformation = UIView()
    let viewResult = UIView()
    let viewButton = UIView()
    
    // setting SubViews
    
    // viewItem SubViews
    let viewITitle = UIView()
    let viewIBody = UIView()
    
    // viewCost SubViews
    let viewInfTitle = UIView()
    let ViewInfBody = UIView()
    
    // viewResult SubViews
    let viewRTitle = UIView()
    let viewRBody = UIView()
    
    // viewResult SubViews
    
    
    let viewCostButton = UIView()
    
    // set viewItem objects
    
    let imgITimage = UIImageView()
    let lblITTitle = UILabel()
    let btnIBMaterials = UIButton()
    let lblIBItemsQuantity = UILabel()
    let lblIBItemsSelected = UILabel()
    let lblIBItemsPrice = UILabel()
    
    // set viewInf objects
    let imgInfTimage = UIImageView()
    let lblInfTTitle = UILabel()
    let lblInfBWorkedHoursTitle = UILabel()
    let lblInfBExternalCostsTitle = UILabel()
    let txtInfBWorkedHours = UITextField()
    let txtInfBExternalCosts = UITextField()
    
    // set viewResult objects
    
    let imgRTimage = UIImageView()
    let lblRTTitle = UILabel()
    let imgRTTitle = UIImageView()
    let lblRBTotal = UILabel()
    let lblRBPriceByHour = UILabel()
    let lblRBTotalResult = UILabel()
    let lblRBPriceByHourResult = UILabel()
    
    //set viewButton objects
    
    let btnVBAddProjects = UIButton()
    
    func setLayoutInView() -> UIView {
        viewGlobal = UIView(frame: (CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        viewGlobal.backgroundColor = .clear
        
        viewGlobal.addSubview(viewNavigationSafeArea)
        viewNavigationSafeArea.translatesAutoresizingMaskIntoConstraints = false
        viewNavigationSafeArea.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.heightAnchor.constraint(equalToConstant: UIApplication.shared.statusBarFrame.height + 24).isActive = true
        viewNavigationSafeArea.backgroundColor = .clear
        
        viewGlobal.addSubview(viewAplication)
        viewAplication.translatesAutoresizingMaskIntoConstraints = false
        viewAplication.topAnchor.constraint(equalTo: viewNavigationSafeArea.bottomAnchor, constant: 0).isActive = true
        viewAplication.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewAplication.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewAplication.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        viewAplication.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundCalculadora")!)
        
        viewAplication.addSubview(viewItem)
        viewItem.translatesAutoresizingMaskIntoConstraints = false
        viewItem.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 70).isActive = true
        viewItem.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewItem.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewItem.heightAnchor.constraint(equalToConstant: 92).isActive = true
        viewItem.backgroundColor = .clear
        
        viewAplication.addSubview(viewInformation)
        viewInformation.translatesAutoresizingMaskIntoConstraints = false
        viewInformation.topAnchor.constraint(equalTo: viewItem.bottomAnchor, constant: 10).isActive = true
        viewInformation.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewInformation.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewInformation.heightAnchor.constraint(equalToConstant: 130).isActive = true
        viewInformation.backgroundColor = .clear
        
        viewAplication.addSubview(viewResult)
        viewResult.translatesAutoresizingMaskIntoConstraints = false
        viewResult.topAnchor.constraint(equalTo: viewInformation.bottomAnchor, constant: 10).isActive = true
        viewResult.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewResult.widthAnchor.constraint(equalToConstant: 300).isActive = true
        viewResult.heightAnchor.constraint(equalToConstant: 130).isActive = true
        viewResult.backgroundColor = .clear
        
        viewAplication.addSubview(viewButton)
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.topAnchor.constraint(equalTo: viewResult.bottomAnchor, constant: 10).isActive = true
        viewButton.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewButton.widthAnchor.constraint(equalToConstant: 275).isActive = true
        viewButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        viewButton.backgroundColor = .clear
        
        //Setting SubViews
        //Setting ViewItem SubViews
        
        viewItem.addSubview(viewITitle)
        viewITitle.translatesAutoresizingMaskIntoConstraints = false
        viewITitle.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 0).isActive = true
        viewITitle.leftAnchor.constraint(equalTo: viewItem.leftAnchor, constant: 0).isActive = true
        viewITitle.rightAnchor.constraint(equalTo: viewItem.rightAnchor, constant: 0).isActive = true
        viewITitle.heightAnchor.constraint(equalToConstant: 46).isActive = true
    
        
        viewItem.addSubview(viewIBody)
        viewIBody.translatesAutoresizingMaskIntoConstraints = false
        viewIBody.topAnchor.constraint(equalTo: viewITitle.bottomAnchor, constant: 0).isActive = true
        viewIBody.leftAnchor.constraint(equalTo: viewItem.leftAnchor, constant: 0).isActive = true
        viewIBody.rightAnchor.constraint(equalTo: viewItem.rightAnchor, constant: 0).isActive = true
        viewIBody.bottomAnchor.constraint(equalTo: viewItem.bottomAnchor, constant: 0).isActive = true
        viewIBody.backgroundColor = .white
        viewIBody.layer.cornerRadius = 7
        viewIBody.dropShadow()
        
        
        //Setting ViewInformation SubViews
        
        viewInformation.addSubview(viewInfTitle)
        viewInfTitle.translatesAutoresizingMaskIntoConstraints = false
        viewInfTitle.topAnchor.constraint(equalTo: viewInformation.topAnchor, constant: 0).isActive = true
        viewInfTitle.leftAnchor.constraint(equalTo: viewInformation.leftAnchor, constant: 0).isActive = true
        viewInfTitle.rightAnchor.constraint(equalTo: viewInformation.rightAnchor, constant: 0).isActive = true
        viewInfTitle.heightAnchor.constraint(equalToConstant: 46).isActive = true
        viewInfTitle.backgroundColor = .clear
        
        viewInformation.addSubview(ViewInfBody)
        ViewInfBody.translatesAutoresizingMaskIntoConstraints = false
        ViewInfBody.topAnchor.constraint(equalTo: viewInfTitle.bottomAnchor, constant: 0).isActive = true
        ViewInfBody.leftAnchor.constraint(equalTo: viewInformation.leftAnchor, constant: 0).isActive = true
        ViewInfBody.rightAnchor.constraint(equalTo: viewInformation.rightAnchor, constant: 0).isActive = true
        ViewInfBody.bottomAnchor.constraint(equalTo: viewInformation.bottomAnchor, constant: 0).isActive = true
        ViewInfBody.backgroundColor = .white
        ViewInfBody.layer.cornerRadius = 7
        
        //Setting ViewResult SubViews
        
        viewResult.addSubview(viewRTitle)
        viewRTitle.translatesAutoresizingMaskIntoConstraints = false
        viewRTitle.topAnchor.constraint(equalTo: viewResult.topAnchor, constant: 0).isActive = true
        viewRTitle.leftAnchor.constraint(equalTo: viewResult.leftAnchor, constant: 0).isActive = true
        viewRTitle.rightAnchor.constraint(equalTo: viewResult.rightAnchor, constant: 0).isActive = true
        viewRTitle.heightAnchor.constraint(equalToConstant: 46).isActive = true
        viewRTitle.backgroundColor = .clear
        
        viewResult.addSubview(viewRBody)
        viewRBody.translatesAutoresizingMaskIntoConstraints = false
        viewRBody.topAnchor.constraint(equalTo: viewRTitle.bottomAnchor, constant: 0).isActive = true
        viewRBody.leftAnchor.constraint(equalTo: viewResult.leftAnchor, constant: 0).isActive = true
        viewRBody.rightAnchor.constraint(equalTo: viewResult.rightAnchor, constant: 0).isActive = true
        viewRBody.bottomAnchor.constraint(equalTo: viewResult.bottomAnchor, constant: 0).isActive = true
        viewRBody.backgroundColor = .white
        viewRBody.layer.cornerRadius = 7
        
        
        //Setting Objects
        
        setViewItemLayout()
        setViewInformationLayout()
        setViewResultLayout()
        setViewButtonLayout()
        
        return viewGlobal
        
    }
    
    func setViewItemLayout() {
        
        //Title View
        
        imgITimage.frame = CGRect(x: 4, y: 0, width: 34, height: 34)
        imgITimage.setImage(image: UIImage(named: "iconProfile01")!)
        viewRTitle.addSubview(imgITimage)
        
        lblITTitle.frame = CGRect(x: 50, y: 10, width: 222, height: 21)
        lblITTitle.setLabelWhithConstraints(fontType: .three,
                                            fontSize: 18,
                                            lblText: "Adicionar Itens",
                                            textColor: .workBlack,
                                            alingnment: .left,
                                            alpha: 0.7)
        viewITitle.addSubview(lblITTitle)
        
        //Body View
        
        viewIBody.addSubview(btnIBMaterials)
        btnIBMaterials.translatesAutoresizingMaskIntoConstraints = false
        btnIBMaterials.topAnchor.constraint(equalTo: viewIBody.topAnchor, constant: 0).isActive = true
        btnIBMaterials.bottomAnchor.constraint(equalTo: viewIBody.bottomAnchor, constant: 0).isActive = true
        btnIBMaterials.leftAnchor.constraint(equalTo: viewIBody.leftAnchor, constant: 0).isActive = true
        btnIBMaterials.rightAnchor.constraint(equalTo: viewIBody.rightAnchor, constant: 0).isActive = true
        
        lblIBItemsQuantity.frame = CGRect(x: 14, y: 12, width: 16, height: 21)
        lblIBItemsQuantity.setLabelWhithConstraints(fontType: .three,
                                                    fontSize: 18,
                                                    lblText: "2",
                                                    textColor: .workBlack,
                                                    alingnment: .left,
                                                    alpha: 1)
        viewIBody.addSubview(lblIBItemsQuantity)
        
        lblIBItemsSelected.frame = CGRect(x: 40, y: 14, width: 155, height: 16)
        lblIBItemsSelected.setLabelWhithConstraints(fontType: .two,
                                                    fontSize: 14,
                                                    lblText: "Itens Selecionados",
                                                    textColor: .workBlack,
                                                    alingnment: .left,
                                                    alpha: 1)
        viewIBody.addSubview(lblIBItemsSelected)
        
        
        lblIBItemsPrice.frame = CGRect(x: 205, y: 14, width: 73, height: 16)
        lblIBItemsPrice.setLabelWhithConstraints(fontType: .one,
                                                 fontSize: 14,
                                                 lblText: "R$xx,xx",
                                                 textColor: .workBlack,
                                                 alingnment: .right,
                                                 alpha: 0.7)
        viewIBody.addSubview(lblIBItemsPrice)
        
        

        
        
    }
    
    func setViewInformationLayout() {
        
        //Title View
        
        imgInfTimage.frame = CGRect(x: 4, y: 0, width: 34, height: 34)
        imgInfTimage.setImage(image: UIImage(named: "iconProfile02")!)
        viewInfTitle.addSubview(imgInfTimage)

        lblInfTTitle.frame = CGRect(x: 50, y: 10, width: 222, height: 21)
        lblInfTTitle.setLabelWhithConstraints(fontType: .three,
                                              fontSize: 18,
                                              lblText: "Informações do projeto",
                                              textColor: .workBlack,
                                              alingnment: .left,
                                              alpha: 0.7)
        viewInfTitle.addSubview(lblInfTTitle)
        
        //Body View
        
        lblInfBWorkedHoursTitle.frame = CGRect(x: 10, y: 13.5, width: 142, height: 16)
        lblInfBWorkedHoursTitle.setLabelWhithConstraints(fontType: .two,
                                                         fontSize: 14,
                                                         lblText: "Horas Trabalhadas",
                                                         textColor: .workBlack,
                                                         alingnment: .left,
                                                         alpha: 1)
        ViewInfBody.addSubview(lblInfBWorkedHoursTitle)
        
        lblInfBExternalCostsTitle.frame = CGRect(x: 10, y: 51, width: 142, height: 16)
        lblInfBExternalCostsTitle.setLabelWhithConstraints(fontType: .two,
                                                           fontSize: 14,
                                                           lblText: "Custos extras",
                                                           textColor: .workBlack,
                                                           alingnment: .left,
                                                           alpha: 1)
        ViewInfBody.addSubview(lblInfBExternalCostsTitle)
        
        txtInfBWorkedHours.frame = CGRect(x: 200, y: 6, width: 87, height: 32)
        txtInfBWorkedHours.setTextField(fontType: .two,
                                        fontSize: 18,
                                        lblText: "N/h",
                                        textColor: .workGrey,
                                        alingnment: .rigth,
                                        alpha: 0.7)
        ViewInfBody.addSubview(txtInfBWorkedHours)
        
        txtInfBExternalCosts.frame = CGRect(x: 200, y: 46, width: 87, height: 32)
        txtInfBExternalCosts.setTextField(fontType: .two,
                                          fontSize: 18,
                                          lblText: "$Y",
                                          textColor: .workGrey,
                                          alingnment: .rigth,
                                          alpha: 0.7)
        ViewInfBody.addSubview(txtInfBExternalCosts)
        
        
        
    }
    
    func setViewResultLayout() {
        
        
        //Title View
        
        imgRTimage.frame = CGRect(x: 4, y: 0, width: 34, height: 34)
        imgRTimage.setImage(image: UIImage(named: "iconProfile03")!)
        viewRTitle.addSubview(imgRTimage)
        
        lblRTTitle.frame = CGRect(x: 50, y: 10, width: 222, height: 21)
        lblRTTitle.setLabelWhithConstraints(fontType: .three,
                                              fontSize: 18,
                                              lblText: "Informações do projeto",
                                              textColor: .workBlack,
                                              alingnment: .left,
                                              alpha: 0.7)
        viewRTitle.addSubview(lblRTTitle)
        
        //Body View
        
        lblRBTotal.frame = CGRect(x: 10, y: 8, width: 116, height: 21)
        lblRBTotal.setLabelWhithConstraints(fontType: .three,
                                            fontSize: 18,
                                            lblText: "Total",
                                            textColor: .workBlack,
                                            alingnment: .left,
                                            alpha: 0.45)
        viewRBody.addSubview(lblRBTotal)
        
        lblRBPriceByHour.frame = CGRect(x: 10, y: 50, width: 116, height: 21)
        lblRBPriceByHour.setLabelWhithConstraints(fontType: .three,
                                            fontSize: 18,
                                            lblText: "Preço da Hora",
                                            textColor: .workBlack,
                                            alingnment: .left,
                                            alpha: 0.45)
        viewRBody.addSubview(lblRBPriceByHour)
        
        lblRBTotalResult.frame = CGRect(x: 145, y: 8, width: 127, height: 16)
        lblRBTotalResult.setLabelWhithConstraints(fontType: .three,
                                            fontSize: 18,
                                            lblText: "Itens + Extras",
                                            textColor: .workBlack,
                                            alingnment: .right,
                                            alpha: 0.45)
        viewRBody.addSubview(lblRBTotalResult)
        
        lblRBPriceByHourResult.frame = CGRect(x: 145, y: 50, width: 127, height: 16)
        lblRBPriceByHourResult.setLabelWhithConstraints(fontType: .three,
                                            fontSize: 18,
                                            lblText: "total/hora",
                                            textColor: .workBlack,
                                            alingnment: .right,
                                            alpha: 0.45)
        viewRBody.addSubview(lblRBPriceByHourResult)
        
        
        
    }
    
    func setViewButtonLayout() {
        
        btnVBAddProjects.frame = CGRect(x: 0, y: 0, width: 275, height: 45)
        viewButton.addSubview(btnVBAddProjects)
        
        btnVBAddProjects.layer.cornerRadius = 7
        btnVBAddProjects.backgroundColor = .workBlue
        btnVBAddProjects.setTitle("Add to my projects", for: .normal)
    }
    

}
