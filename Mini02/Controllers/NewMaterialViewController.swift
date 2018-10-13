//
//  NewMaterialViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 12/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewMaterialViewController: UIViewController, UITextFieldDelegate {
    
    let newMaterial = NewMaterialView()
    var categoriaEscolhida: String?
    var tap: UITapGestureRecognizer?
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "Material")
        self.view = newMaterial.setLayoutInView()
        self.title = "Novo material"
        
        addButtonsTargets()
        addDelegateToTxtFields()
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(cadastrarMaterial) ), animated: true)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        self.view.addGestureRecognizer(tap!)
      
    }
    
    func addDelegateToTxtFields(){
        newMaterial.txtPrice.delegate = self
        newMaterial.txtMaterialName.delegate = self
        newMaterial.txtMaterialOrigin.delegate = self
        newMaterial.txtMaterialQuantity.delegate = self
    }
    
    @objc func abaixarTeclado() {
       newMaterial.viewGlobal.endEditing(true)
    }
    
    func addButtonsTargets(){
        newMaterial.btnPapelaria.addTarget(self, action: #selector(NewMaterialViewController.btnPapelaria), for: .touchDown)
        newMaterial.btnSeam.addTarget(self, action: #selector(NewMaterialViewController.btnSeam), for:  .touchDown)
        newMaterial.btnOrganization.addTarget(self, action: #selector(NewMaterialViewController.btnOrganization), for:  .touchDown)
        newMaterial.btnPainting.addTarget(self, action: #selector(NewMaterialViewController.btnPainting), for:  .touchDown)
        newMaterial.btnCraftwork.addTarget(self, action: #selector(NewMaterialViewController.btnCraftwork), for:  .touchDown)
        newMaterial.btnWoodwork.addTarget(self, action: #selector(NewMaterialViewController.btnWoodwork), for:  .touchDown)
        newMaterial.btnDecoration.addTarget(self, action: #selector(NewMaterialViewController.btnDecoration), for:  .touchDown)
        newMaterial.btnOthers.addTarget(self, action: #selector(NewMaterialViewController.btnOthers), for:  .touchDown)
    }
    
    // MARK: Buttons actions
    
    func desmarcarTodosOsBotoes(){
        categoriaEscolhida = nil
        desmarcarBotao(btn: newMaterial.btnPapelaria)
        desmarcarBotao(btn: newMaterial.btnSeam)
        desmarcarBotao(btn: newMaterial.btnOrganization)
        desmarcarBotao(btn: newMaterial.btnPainting)
        desmarcarBotao(btn: newMaterial.btnCraftwork)
        desmarcarBotao(btn: newMaterial.btnWoodwork)
        desmarcarBotao(btn: newMaterial.btnDecoration)
        desmarcarBotao(btn: newMaterial.btnOthers)
    }
    
    func marcarBotao(btn:UIButton){
        desmarcarTodosOsBotoes()
        btn.isSelected = true
        btn.backgroundColor = .white
        btn.setTitleColor(.black , for: .normal)
        categoriaEscolhida = btn.titleLabel?.text!
    }
    
    func desmarcarBotao(btn: UIButton){
        btn.isSelected = false
        btn.backgroundColor = .black
        btn.setTitleColor(.white , for: .normal)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text?.removeAll()
    }
    
    @objc func cadastrarMaterial(){
        guard let nomeMaterial = newMaterial.txtMaterialName.text else {return}
        guard let precoMaterialString = newMaterial.txtPrice.text else {return}
        guard let precoMaterial =  Float(precoMaterialString) else {return}
        guard let marcaMaterial = newMaterial.txtMaterialOrigin.text else {return}
        guard let categoria = categoriaEscolhida else {return}
        
        let material = Material(nome: nomeMaterial, tipo: categoria, preco: precoMaterial, marca: marcaMaterial )
        
        guard let ref = self.ref else{return}
        
        let materialRef = ref.childByAutoId()
        
        materialRef.setValue(material.toAnyObject())
        
        goToMaterialViewController()
    }
    
    func goToMaterialViewController(){
        let materialView = MaterialViewController()
        navigationController?.pushViewController(materialView, animated: true)
    }
    
    @objc func btnPapelaria() {
        
        if newMaterial.btnPapelaria.isSelected == true {
           desmarcarBotao(btn: newMaterial.btnPapelaria)
        }else {
            marcarBotao(btn: newMaterial.btnPapelaria)
        }
    }
    
    @objc func btnSeam() {
        if newMaterial.btnSeam.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnSeam)
        }else {
            marcarBotao(btn: newMaterial.btnSeam)
        }
    }
    
    @objc func btnOrganization() {
        if newMaterial.btnOrganization.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnOrganization)
        }else {
          marcarBotao(btn: newMaterial.btnOrganization)
        }
    }
    
    @objc func btnPainting() {
        if newMaterial.btnPainting.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnPainting)
        }else {
            marcarBotao(btn: newMaterial.btnPainting)
        }
    }
    
    @objc func btnCraftwork() {
        if newMaterial.btnCraftwork.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnCraftwork)
        }else {
           marcarBotao(btn: newMaterial.btnCraftwork)
        }
    }
    
    @objc func btnWoodwork() {
        if newMaterial.btnWoodwork.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnWoodwork)
        }else {
            marcarBotao(btn: newMaterial.btnWoodwork)
        }
    }
    
    @objc func btnDecoration() {
        if newMaterial.btnDecoration.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnDecoration)
        }else {
            marcarBotao(btn: newMaterial.btnDecoration)
        }
    }
    
    @objc func btnOthers() {

        if newMaterial.btnOthers.isSelected == true {
            desmarcarBotao(btn: newMaterial.btnOthers)
        }else {
            marcarBotao(btn: newMaterial.btnOthers)
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
