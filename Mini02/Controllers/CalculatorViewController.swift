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
        verificarInputs()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        self.navigationItem.title = "Novo Projetro"
        
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
        let precoHora = (valorItens + custosExtras) / horasTrabalhadas
        viewCalculator.lblRBPriceByHourResult.text = "R$ \((String(format: "%.2f", precoHora)))"
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
    
    func verificarInputs(){
        if materiaisSelecionados.count > 0 && horasTrabalhadas > 0{
            viewCalculator.btnVBAddProjects.backgroundColor = .workGreen
        }else{
            viewCalculator.btnVBAddProjects.backgroundColor = .gray
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        if textField.text == "" {
            
            
            if textField == viewCalculator.txtInfBWorkedHours{
                textField.text = "0"
                horasTrabalhadas = 0
                setLabels()
                
            }
            
            if textField == viewCalculator.txtInfBExternalCosts{
                textField.text = "0"
                custosExtras = 0
                setLabels()
                
            }

            return
        }
        
        if textField == viewCalculator.txtInfBWorkedHours{

            horasTrabalhadas = Float(textField.text!)!
            setLabels()
            
        }
        
        if textField == viewCalculator.txtInfBExternalCosts{
            
            custosExtras = Float(textField.text!)!
            setLabels()
            
        }

        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == viewCalculator.txtInfBWorkedHours{
            
            //BACKSPACE
            let char = string.cString(using: String.Encoding.utf8)!
            
            let isBackSpace = strcmp(char, "\\b")
            
            if (isBackSpace == -92) {
                var novoTxt = textField.text
                novoTxt?.popLast()
                guard let txtFloat = Float(novoTxt!) else {
                    horasTrabalhadas = 0
                    return true
                }
                guard let float = Float(novoTxt!) else {
                    horasTrabalhadas = 1
                    setLabels()
                    return true
                }
                horasTrabalhadas = float
                verificarInputs()
                setLabels()
                return true
            }
            
            guard let horasTrabalhadasFloat = Float(string), horasTrabalhadasFloat >= 0 else {return true}
            
            let a = "\(Int(horasTrabalhadas))"
            var b = "\(a)\(string)"
            
            if horasTrabalhadas <= 0{
                b = string
            }
            
            horasTrabalhadas = Float(Int(b)!)
            
            verificarInputs()
            
            setLabels()
            return true
        }
        
        if textField == viewCalculator.txtInfBExternalCosts{
            //BACKSPACE
            let char = string.cString(using: String.Encoding.utf8)!
            
            let isBackSpace = strcmp(char, "\\b")
            
            if (isBackSpace == -92) {
                var novoTxt = textField.text
                novoTxt?.popLast()
                guard let txtFloat = Float(novoTxt!) else {
                    custosExtras = 0
                    setLabels()
                    return true
                }
                guard let float = Float(novoTxt!) else {
                    custosExtras = 0
                    setLabels()
                    return true
                }
                custosExtras = float
                setLabels()
                return true
            }
            guard let custosExtrasFloat = Float(string), custosExtrasFloat >= 0 else { return true }
            
            let a = "\(Int(custosExtras))"
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
    
    func goToLoginViewController(){
        
        let storyBoard = UIStoryboard(name: "OnboardStoryboard", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "StartButtonViewController")
        self.navigationController?.pushViewController(novoViewController, animated: true)
        
    }
    
    @objc func addProject(){
        
        if usuario == nil {
            
            let alert = UIAlertController(title: "Faça login para salvar", message: "Você precisa estar logado para salvar seu projeto", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Logar", style: .default, handler: { action in
               
               self.goToLoginViewController()
                
            }))
            
            self.present(alert, animated: true)
            
            return
            
        }

        guard let horasTrabalhadasString = viewCalculator.txtInfBWorkedHours.text, horasTrabalhadasString.count > 0 else { return }
        
        guard let horasTrabalhadasFloat = Float(horasTrabalhadasString), horasTrabalhadasFloat > 0 else { return }
        
        guard let custosExtrasString = viewCalculator.txtInfBExternalCosts.text, custosExtrasString.count > 0 else { return }
        
        guard let custosExtrasFloat = Float(custosExtrasString), custosExtrasFloat >= 0 else { return }
        
        if materiaisSelecionados.count == 0 {
            return
        }
        
            for material in materiaisSelecionados {
                materiais.append(material.toAnyObject())
            }
        
        if usuario == nil {
             projeto = Projeto(materiais: materiais, custosExtras: custosExtrasFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
            projeto?.setTotal(total: valorItens + custosExtrasFloat)
            
        }else{
            projeto = Projeto(usuario: usuario!, materiais: materiais, custosExtras: custosExtrasFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
              projeto?.setTotal(total: valorItens + custosExtrasFloat)
        }
        
        
        goToNewProjectViewController()
    
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
