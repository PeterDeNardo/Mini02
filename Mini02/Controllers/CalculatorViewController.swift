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
    
    var total: Float = 0.00
    
    var custosExtras: Float = 0.00
    
    var lucroPretendido: Float = 0.00
    
    var horasTrabalhadas: Float = 0.00
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        setLabels()
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
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
  
    }
    
    func addDelegateToTxtFields(){
//        viewCalculator.txtVCWorkedHours.delegate = self
//        viewCalculator.txtVPProfit.delegate = self
    }
    
    func setLabels(){
//        viewCalculator.lblVIQuantity.text = "\(materiaisSelecionados.count)"
//        viewCalculator.lblVRTotal.text = "R$ \(valorItens)"
//        viewCalculator.lblVIQUantityTotalMoney.text = "R$ \(total)"
//        viewCalculator.lblVRTotal.text = "R$ \(total + custosExtras) "
//        viewCalculator.lblVPProfitByHour.text = "R$ \(lucroPretendido/horasTrabalhadas)"
//        viewCalculator.lblVRTotalByHour.text = "R$ \(total/horasTrabalhadas)"
    }
    
    func addButtonsTargets() {
//        viewCalculator.btnCostsButton.addTarget(self, action: #selector(CalculatorViewController.goToCalculatorPluss), for: .touchDown)
        viewCalculator.btnIBMaterials.addTarget(self, action: #selector(CalculatorViewController.goToMaterialViewController), for: .touchDown)
//        viewCalculator.btnVBAddProjects.addTarget(self, action: #selector(CalculatorViewController.addProject), for: .touchDown)
        
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
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        if textField.text == "" {
//            textField.text = "0"
//
//            if textField == viewCalculator.txtVCWorkedHours{
//
//                horasTrabalhadas = 0
//                setLabels()
//
//            }
//
//            if textField == viewCalculator.txtVPProfit{
//
//                lucroPretendido = 0
//                setLabels()
//
//            }
//
//            return
//        }
//
//        if textField == viewCalculator.txtVCWorkedHours{
//
//            horasTrabalhadas = Float(textField.text!)!
//            setLabels()
//
//        }
//
//        if textField == viewCalculator.txtVPProfit{
//            lucroPretendido = Float(textField.text!)!
//            setLabels()
//        }
//
//
//
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//
//        if textField == viewCalculator.txtVCWorkedHours{
//            guard let horasTrabalhadasFloat = Float(string), horasTrabalhadasFloat >= 0 else { return true }
//
//            var a = "\(Int(horasTrabalhadas))"
//            var b = "\(a)\(string)"
//
//            if horasTrabalhadas <= 0{
//                b = string
//            }
//
//            horasTrabalhadas = Float(Int(b)!)
//            setLabels()
//            return true
//        }
//
//        if textField == viewCalculator.txtVPProfit{
//            guard let lucroPretendidoFloat = Float(string), lucroPretendidoFloat >= 0 else { return true }
//            var a = "\(Int(lucroPretendidoFloat))"
//            var b = "\(a)\(string)"
//            if horasTrabalhadas <= 0{
//                b = string
//            }
//            lucroPretendido = Float(Int(b)!)
//            setLabels()
//            return true
//        }
//        return false
//    }
//
//    @objc func addProject(){
//
//        guard let horasTrabalhadasString = viewCalculator.txtVCWorkedHours.text, horasTrabalhadasString.count > 0 else { return }
//
//        guard let horasTrabalhadasFloat = Float(horasTrabalhadasString), horasTrabalhadasFloat > 0 else { return }
//
//        guard let lucroPretendidoString = viewCalculator.txtVPProfit.text, lucroPretendidoString.count > 0 else { return }
//
//        guard let lucroPretendidoFloat = Float(lucroPretendidoString), lucroPretendidoFloat > 0 else { return }
//
//        if materiaisSelecionados.count == 0 {
//            return
//        }
//
//        var projeto: Projeto?
//
//            for material in materiaisSelecionados {
//                materiais.append(material.toAnyObject())
//            }
//
//        if usuario == nil {
//             projeto = Projeto(materiais: materiais, lucroPretendido: lucroPretendidoFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
//        }else{
//            projeto = Projeto(usuario: usuario!, materiais: materiais, lucroPretendido: lucroPretendidoFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
//        }
//
//
//
//
//        //AQUI DEVE PASSAR O PROJETO PARA A PROXIMA TELA, ONDE ELE VAI ESCOLHER O NOME DO PROJETO E A CATEGORIA PARA ENTÃO JOGAR NO BANCO COM AS LINHAS ABAIXO!!!
//
//        guard let ref = self.ref else{return}
//
//        let projetoRef = ref.childByAutoId()
//
//        projetoRef.setValue(projeto?.toAnyObject())
//
//
//    }
    
    @objc func abaixarTeclado() {
        viewCalculator.viewGlobal.endEditing(true)
    }
    
    @objc func goToMaterialViewController () {
        let materialsView = MaterialViewController()
        materialsView.materiaisSelecionados = self.materiaisSelecionados
        navigationController?.pushViewController(materialsView, animated: true)
    }
    
//    @objc func goToCalculatorPluss() {
//        let calculatorPluss = CalculatorPlussViewController()
//        navigationController?.pushViewController(calculatorPluss, animated: true)
//    }

}
