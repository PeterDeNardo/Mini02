//
//  NewProjectViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CalculatorViewController: UIViewController, UITextFieldDelegate{
    
    private let viewCalculator = CalculatorView()
    
    var tap: UITapGestureRecognizer?
    
    var materiaisSelecionados: [Material] = []
    
    var materiais: [Any] = []
    
    var usuario: [String:String]?
    
    var ref: DatabaseReference?
    
    var valorItens: Float = 0.00
    
    var custosExtras: Float = 0.00
    
    var lucroPretendido: Float = 0.00
    
    var horasTrabalhadas: Float = 0.00
    
     var projeto: Projeto?
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        setLabels()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        self.title = "Novo Projetro"
        
        pegarUserDefaults()
        
        ref = Database.database().reference(withPath: "Projeto")
        
        self.view = viewCalculator.setLayoutInView()
        
        addButtonsTargets()

        addDelegateToTxtFields()
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
  
    }
    
    func addDelegateToTxtFields(){
        viewCalculator.txtInfBWorkedHours.delegate = self
        viewCalculator.txtInfBExternalCosts.delegate = self
    }
    
    func setLabels(){
        viewCalculator.lblIBItemsQuantity.text = "\(materiaisSelecionados.count)"
        viewCalculator.lblIBItemsPrice.text = "R$ \(valorItens)"
        viewCalculator.lblRBTotalResult.text = "R$ \(valorItens + custosExtras)"
        viewCalculator.lblRBPriceByHourResult.text = "R$ \((valorItens + custosExtras)/horasTrabalhadas)"
    }
    
    func addButtonsTargets() {

        viewCalculator.btnIBMaterials.addTarget(self, action: #selector(CalculatorViewController.goToMaterialViewController), for: .touchDown)
        viewCalculator.btnVBAddProjects.addTarget(self, action: #selector(CalculatorViewController.addProject), for: .touchDown)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        self.view.addGestureRecognizer(tap!)
    }
    
    func pegarUserDefaults(){
        
        let defaults = UserDefaults.standard
   
       usuario = [
            "nome" : defaults.string(forKey: "nome"),
            "email" : defaults.string(forKey: "email"),
            "id" : defaults.string(forKey: "id")
        ] as? [String : String]
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let text = Int(textField.text!) else{
             textField.text?.removeAll()
            textField.keyboardType = .numberPad
            return
        }
       
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        if textField.text == "" {
            textField.text = "0"
            
            if textField == viewCalculator.txtInfBWorkedHours{
                
                horasTrabalhadas = 0
                setLabels()
                
            }
            
            
            return
        }
        
        if textField == viewCalculator.txtInfBWorkedHours{

            horasTrabalhadas = Float(textField.text!)!
            setLabels()
            
        }
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == viewCalculator.txtInfBWorkedHours{
            guard let horasTrabalhadasFloat = Float(string), horasTrabalhadasFloat >= 0 else { return true }
            
            var a = "\(Int(horasTrabalhadas))"
            var b = "\(a)\(string)"
            
            if horasTrabalhadas <= 0{
                b = string
            }
           
            horasTrabalhadas = Float(Int(b)!)
            setLabels()
            return true
        }
        
        if textField == viewCalculator.txtInfBExternalCosts{
            guard let horasTrabalhadasFloat = Float(string), horasTrabalhadasFloat >= 0 else { return true }
            
            var a = "\(Int(custosExtras))"
            var b = "\(a)\(string)"
            
            if custosExtras <= 0{
                b = string
            }
            
            custosExtras = Float(Int(b)!)
            setLabels()
            return true
        }
        
        return false
    }
    
    func goToNewProjectViewController(){
        let newProjectView = NewProjectViewController()
        newProjectView.projeto = self.projeto
        navigationController?.pushViewController(newProjectView, animated: true)
    }
    
    @objc func addProject(){

        guard let horasTrabalhadasString = viewCalculator.txtInfBWorkedHours.text, horasTrabalhadasString.count > 0 else { return }
        
        guard let horasTrabalhadasFloat = Float(horasTrabalhadasString), horasTrabalhadasFloat > 0 else { return }
        
       
        if materiaisSelecionados.count == 0 {
            return
        }
        
       
        
            for material in materiaisSelecionados {
                materiais.append(material.toAnyObject())
            }
        
        if usuario == nil {
             projeto = Projeto(materiais: materiais, lucroPretendido: 0, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
        }else{
            projeto = Projeto(usuario: usuario!, materiais: materiais, lucroPretendido: 0, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
        }
        
        
        goToNewProjectViewController()
        
        
        //AQUI DEVE PASSAR O PROJETO PARA A PROXIMA TELA, ONDE ELE VAI ESCOLHER O NOME DO PROJETO E A CATEGORIA PARA ENTÃO JOGAR NO BANCO COM AS LINHAS ABAIXO!!!
        
        
        
        
    }
    

    
    @objc func abaixarTeclado() {
        viewCalculator.viewGlobal.endEditing(true)
    }
    
    @objc func goToMaterialViewController () {
        let materialsView = MaterialViewController()
        materialsView.materiaisSelecionados = self.materiaisSelecionados
        navigationController?.pushViewController(materialsView, animated: true)
    }

    


}
