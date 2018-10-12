
import Foundation
import UIKit

class NewMaterialView {
    //MARK: Setting objects in screen
    //Creating Global View
    
    var viewGlobal : UIView!
    
    //Creating Views
    
    let viewNavigationSafeArea = UIView()
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
    
    func setLayoutInView() -> UIView{
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewGlobal.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        
        viewGlobal.addSubview(viewNavigationSafeArea)
        viewNavigationSafeArea.translatesAutoresizingMaskIntoConstraints = false
        viewNavigationSafeArea.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.heightAnchor.constraint(equalToConstant: 68).isActive = true
        viewNavigationSafeArea.backgroundColor = .red
        
        viewGlobal.addSubview(viewMaterialRegister)
        viewMaterialRegister.translatesAutoresizingMaskIntoConstraints = false
        viewMaterialRegister.topAnchor.constraint(equalTo: viewNavigationSafeArea.bottomAnchor, constant: 22).isActive = true
        viewMaterialRegister.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 55).isActive = true
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
        lblMaterialName.setLabelWhithConstraints(fontSize: 18,
                                                 lblText: "Nome do material",
                                                 textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                                 alingnment: .left,
                                                 alpha: 1)
        viewMRInfos.addSubview(lblMaterialName)
        
        lblMaterialOrigin.frame = CGRect(x: 19, y: 86, width: 244, height: 21)
        lblMaterialOrigin.setLabelWhithConstraints(fontSize: 18,
                                                   lblText: "Marca ou local de compra",
                                                   textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                                   alingnment: .left,
                                                   alpha: 1)
        viewMRInfos.addSubview(lblMaterialOrigin)
        
        lblQuantity.frame = CGRect(x: 19, y: 170, width: 126, height: 21)
        lblQuantity.setLabelWhithConstraints(fontSize: 18,
                                             lblText: "Quantidade",
                                             textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                             alingnment: .left,
                                             alpha: 1)
        viewMRInfos.addSubview(lblQuantity
        )
        lblPrice.frame = CGRect(x: 200, y: 170, width: 126, height: 21)
        lblPrice.setLabelWhithConstraints(fontSize: 18,
                                          lblText: "Preço",
                                          textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                          alingnment: .left,
                                          alpha: 1)
        viewMRInfos.addSubview(lblPrice)
        
        txtMaterialName.frame = CGRect(x: 25, y: 41, width: 155, height: 24)
        txtMaterialName.setTextField(fontSize: 20,
                                     lblText: "|Digite um nome",
                                     textColor: UIColor(red:0.57, green:0.56, blue:0.56, alpha:1.0),
                                     alingnment: .left,
                                     alpha: 0.7)
        viewMRInfos.addSubview(txtMaterialName)
        
        txtMaterialOrigin.frame = CGRect(x: 25, y: 117, width: 155, height: 24)
        txtMaterialOrigin.setTextField(fontSize: 20,
                                       lblText: "|Digite um nome",
                                       textColor: UIColor(red:0.57, green:0.56, blue:0.56, alpha:1.0),
                                       alingnment: .left,
                                       alpha: 0.7)
        viewMRInfos.addSubview(txtMaterialOrigin)
        
        txtMaterialQuantity.frame = CGRect(x: 19, y: 211, width: 39, height: 21)
        txtMaterialQuantity.setTextField(fontSize: 18,
                                         lblText: "X un",
                                         textColor: .blue,
                                         alingnment: .left,
                                         alpha: 1)
        viewMRInfos.addSubview(txtMaterialQuantity)
        
        txtPrice.frame = CGRect(x: 205, y: 211, width: 24, height: 21)
        txtPrice.setTextField(fontSize: 18,
                              lblText: "$Y",
                              textColor: .blue,
                              alingnment: .left,
                              alpha: 1)
        viewMRInfos.addSubview(txtPrice)
        
        
    }
    
    func setObjectsInViewMRCategories() {
        
        lblMRCategoriesTitle.frame = CGRect(x: 19, y: 17, width: 126, height: 21)
        lblMRCategoriesTitle.setLabelWhithConstraints(fontSize: 18,
                                                      lblText: "Categoria",
                                                      textColor: UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0),
                                                      alingnment: .left,
                                                      alpha: 1)
        
        viewMRCategories.addSubview(lblMRCategoriesTitle)
        
        btnPapelaria.frame = CGRect(x: 20, y: 65, width: 70, height: 70)
        btnPapelaria.setButton(titleText: "Papelaria",
                               backgroundColor: .black)
        viewMRCategories.addSubview(btnPapelaria)
        
        btnSeam.frame = CGRect(x: 100, y: 65, width: 70, height: 70)
        btnSeam.setButton(titleText: "Costura",
                               backgroundColor: .black)
        viewMRCategories.addSubview(btnSeam)
        
        btnOrganization.frame = CGRect(x: 180, y: 65, width: 70, height: 70)
        btnOrganization.setButton(titleText: "Org",
                               backgroundColor: .black)
        viewMRCategories.addSubview(btnOrganization)
        
        btnPainting.frame = CGRect(x: 260, y: 65, width: 70, height: 70)
        btnPainting.setButton(titleText: "Pintura",
                               backgroundColor: .black)
        viewMRCategories.addSubview(btnPainting)
        
        btnCraftwork.frame = CGRect(x: 20, y: 140, width: 70, height: 70)
        btnCraftwork.setButton(titleText: "Artesanato",
                               backgroundColor: .black)
        viewMRCategories.addSubview(btnCraftwork)
        
        btnWoodwork.frame = CGRect(x: 100, y: 140, width: 70, height: 70)
        btnWoodwork.setButton(titleText: "Marcenaria",
                          backgroundColor: .black)
        viewMRCategories.addSubview(btnWoodwork)
        
        btnDecoration.frame = CGRect(x: 180, y: 140, width: 70, height: 70)
        btnDecoration.setButton(titleText: "Decoração",
                                  backgroundColor: .black)
        viewMRCategories.addSubview(btnDecoration)
        
        btnOthers.frame = CGRect(x: 260, y: 140, width: 70, height: 70)
        btnOthers.setButton(titleText: "Outros",
                              backgroundColor: .black)
        viewMRCategories.addSubview(btnOthers)

    }
    

    
}
