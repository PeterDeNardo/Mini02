
import Foundation
import UIKit

class NewMaterialView {
    //MARK: Setting objects in screen
    //Creating Global View
    
    var viewGlobal : UIView!
    
    //Creating Views
    
    let viewMaterialRegister = UIView()
    
    
    //Creating SubViews
    
    //Creating viewMaterialRegister SubViews
    let viewMRInfos = UIView()
    let viewMRCategories = UIView()
    
    
    //Creating Objects inside of views
    
    //viewMRInfos Objects
    
    let lblMaterialName = UILabel()
    let lblMaterialOrigin = UILabel()
    let lblQuantity = UILabel()
    let lblPrice = UILabel()
    
    let txtMaterialName = UITextField()
    let txtMaterialOrigin = UITextField()
    let txtMaterialQuantity = UITextField()
    let txtPrice = UITextField()
    
    //viewMRCategories Objects
    
    let lblMRCategoriesTitle = UILabel()
    
    let btnPapelaria = UIButton()
    let btnSeam = UIButton()
    let btnOrganization = UIButton()
    let btnPainting = UIButton()
    let btnCraftwork = UIButton()
    let btnWoodwork = UIButton()
    let btnDecoration = UIButton()
    let btnOthers = UIButton()
    
    var collectButtons = [UIButton()]
    
    func setLayoutInView() -> UIView{
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewGlobal.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundTableView")!)
        
        viewGlobal.addSubview(viewMaterialRegister)
        viewMaterialRegister.translatesAutoresizingMaskIntoConstraints = false
        viewMaterialRegister.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 75).isActive = true
        viewMaterialRegister.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: -55).isActive = true
        viewMaterialRegister.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 9).isActive = true
        viewMaterialRegister.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: -9).isActive = true
        viewMaterialRegister.backgroundColor = .white
        viewMaterialRegister.layer.cornerRadius = 7
        viewMaterialRegister.dropShadow()
        
        //Setting SubViews
        
        viewMaterialRegister.addSubview(viewMRInfos)
        viewMRInfos.translatesAutoresizingMaskIntoConstraints = false
        viewMRInfos.topAnchor.constraint(equalTo: viewMaterialRegister.topAnchor, constant: 0).isActive = true
        viewMRInfos.leftAnchor.constraint(equalTo: viewMaterialRegister.leftAnchor, constant: 0).isActive = true
        viewMRInfos.rightAnchor.constraint(equalTo: viewMaterialRegister.rightAnchor, constant: 0).isActive = true
        viewMRInfos.heightAnchor.constraint(equalToConstant: 255).isActive = true
        viewMRInfos.backgroundColor = .clear
        
        setObjectsInViewMRInfos()
        
        viewMaterialRegister.addSubview(viewMRCategories)
        viewMRCategories.translatesAutoresizingMaskIntoConstraints = false
        viewMRCategories.topAnchor.constraint(equalTo: viewMRInfos.bottomAnchor, constant: 0).isActive = true
        viewMRCategories.leftAnchor.constraint(equalTo: viewMaterialRegister.leftAnchor, constant: 0).isActive = true
        viewMRCategories.rightAnchor.constraint(equalTo: viewMaterialRegister.rightAnchor, constant: 0).isActive = true
        viewMRCategories.bottomAnchor.constraint(equalTo: viewMaterialRegister.bottomAnchor, constant: 0).isActive = true
        viewMRCategories.backgroundColor = .clear
        
        setObjectsInViewMRCategories()
        
        
        
        
        return viewGlobal
    }
    
    func setObjectsInViewMRInfos() {
        
        //Setting Objects in viewMRInfos
        
        
        lblMaterialName.frame = CGRect(x: 19, y: 14, width: 244, height: 21)
        lblMaterialName.setLabelWhithConstraints(fontType: .two,
                                                 fontSize: 18,
                                                 lblText: "Nome do material",
                                                 textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                                 alingnment: .left,
                                                 alpha: 1)
        viewMRInfos.addSubview(lblMaterialName)
        
        lblMaterialOrigin.frame = CGRect(x: 19, y: 86, width: 244, height: 21)
        lblMaterialOrigin.setLabelWhithConstraints(fontType: .two,
                                                   fontSize: 18,
                                                   lblText: "Marca ou local de compra",
                                                   textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                                   alingnment: .left,
                                                   alpha: 1)
        viewMRInfos.addSubview(lblMaterialOrigin)
        
        lblQuantity.frame = CGRect(x: 19, y: 170, width: 126, height: 21)
        lblQuantity.setLabelWhithConstraints(fontType: .two,
                                             fontSize: 18,
                                             lblText: "Quantidade",
                                             textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                             alingnment: .left,
                                             alpha: 1)
        viewMRInfos.addSubview(lblQuantity
        )
        lblPrice.frame = CGRect(x: 200, y: 170, width: 126, height: 21)
        lblPrice.setLabelWhithConstraints(fontType: .two,
                                          fontSize: 18,
                                          lblText: "Preço",
                                          textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                          alingnment: .left,
                                          alpha: 1)
        viewMRInfos.addSubview(lblPrice)
        
        txtMaterialName.frame = CGRect(x: 25, y: 41, width: 155, height: 24)
        txtMaterialName.setTextField(fontType: .one,
                                     fontSize: 20,
                                     lblText: "|Digite um nome",
                                     textColor: UIColor(red:0.57, green:0.56, blue:0.56, alpha:1.0),
                                     alingnment: .left,
                                     alpha: 0.7,
                                     ifHaveImageName: "NoHaveImage")
        viewMRInfos.addSubview(txtMaterialName)
        
        txtMaterialOrigin.frame = CGRect(x: 25, y: 117, width: 155, height: 24)
        txtMaterialOrigin.setTextField(fontType: .one,
                                       fontSize: 20,
                                       lblText: "|Digite um nome",
                                       textColor: UIColor(red:0.57, green:0.56, blue:0.56, alpha:1.0),
                                       alingnment: .left,
                                       alpha: 0.7,
                                       ifHaveImageName: "NoHaveImage")
        viewMRInfos.addSubview(txtMaterialOrigin)
        
        txtMaterialQuantity.frame = CGRect(x: 19, y: 211, width: 39, height: 21)
        txtMaterialQuantity.setTextField(fontType: .one,
                                         fontSize: 18,
                                         lblText: "X un",
                                         textColor: .workBlue,
                                         alingnment: .left,
                                         alpha: 1,
                                         ifHaveImageName: "textbox")
        viewMRInfos.addSubview(txtMaterialQuantity)
        
        txtPrice.frame = CGRect(x: 205, y: 211, width: 24, height: 21)
        txtPrice.setTextField(fontType: .one,
                              fontSize: 18,
                              lblText: "$Y",
                              textColor: .workBlue,
                              alingnment: .left,
                              alpha: 1,
                              ifHaveImageName: "textbox")
        viewMRInfos.addSubview(txtPrice)
        
        
    }
    
    func setObjectsInViewMRCategories() {
        
        lblMRCategoriesTitle.frame = CGRect(x: 19, y: 17, width: 126, height: 21)
        lblMRCategoriesTitle.setLabelWhithConstraints(fontType: .two,
                                                      fontSize: 18,
                                                      lblText: "Categoria",
                                                      textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                                      alingnment: .left,
                                                      alpha: 1)
        
        viewMRCategories.addSubview(lblMRCategoriesTitle)
        
        btnPapelaria.frame = CGRect(x: 20, y: 65, width: 70, height: 70)
        btnPapelaria.setButton(titleText: "NoUseTitle",
                               backgroundColor: .clear,
                               backgroundImageIfSelected: UIImage(named:"papelariaIconCor")!,
                               backgroundImageIfDiselected: UIImage(named:"papelariaIconPB")!)
        viewMRCategories.addSubview(btnPapelaria)

        btnSeam.frame = CGRect(x: 100, y: 65, width: 70, height: 70)
        btnSeam.setButton(titleText: "NoUseTitle",
                          backgroundColor: .clear,
                          backgroundImageIfSelected: UIImage(named:"costuraIconCor")!,
                          backgroundImageIfDiselected: UIImage(named:"costuraIconPB")!)
        viewMRCategories.addSubview(btnSeam)
        
        btnOrganization.frame = CGRect(x: 180, y: 65, width: 70, height: 70)
        btnOrganization.setButton(titleText: "NoUseTitle",
                                  backgroundColor: .clear,
                                  backgroundImageIfSelected: UIImage(named:"organizacaoIconCor")!,
                                  backgroundImageIfDiselected: UIImage(named:"organizacaoIconPB")!)
        viewMRCategories.addSubview(btnOrganization)
        
        btnPainting.frame = CGRect(x: 260, y: 65, width: 70, height: 70)
        btnPainting.setButton(titleText: "NoUseTitle",
                              backgroundColor: .clear,
                              backgroundImageIfSelected: UIImage(named:"pinturaIconCor")!,
                              backgroundImageIfDiselected: UIImage(named:"pinturaIconPB")!)
        viewMRCategories.addSubview(btnPainting)
        
        btnCraftwork.frame = CGRect(x: 20, y: 140, width: 70, height: 70)
        btnCraftwork.setButton(titleText: "NoUseTitle",
                               backgroundColor: .clear,
                               backgroundImageIfSelected: UIImage(named:"cartonagemIconCor")!,
                               backgroundImageIfDiselected: UIImage(named:"cartonagemIconPB")!)
        viewMRCategories.addSubview(btnCraftwork)
        
        btnWoodwork.frame = CGRect(x: 100, y: 140, width: 70, height: 70)
        btnWoodwork.setButton(titleText: "NoUseTitle",
                              backgroundColor: .clear,
                              backgroundImageIfSelected: UIImage(named:"marcenariaIconCor")!,
                              backgroundImageIfDiselected: UIImage(named:"marcenariaIconPB")!)
        viewMRCategories.addSubview(btnWoodwork)
        
        btnDecoration.frame = CGRect(x: 180, y: 140, width: 70, height: 70)
        btnDecoration.setButton(titleText: "NoUseTitle",
                                backgroundColor: .clear,
                                backgroundImageIfSelected: UIImage(named:"artesanatoIconCor")!,
                                backgroundImageIfDiselected: UIImage(named:"artesanatoIconPB")!)
        viewMRCategories.addSubview(btnDecoration)
        
        btnOthers.frame = CGRect(x: 260, y: 140, width: 70, height: 70)
        btnOthers.setButton(titleText: "NoUseTitle",
                            backgroundColor: .clear,
                            backgroundImageIfSelected: UIImage(named:"papelariaIconCor")!,
                            backgroundImageIfDiselected: UIImage(named:"papelariaIconPB")!)
        viewMRCategories.addSubview(btnOthers)

    }
    

    
}
