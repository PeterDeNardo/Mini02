//
//  NewProjectViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CalculatorViewController: UIViewController{
    
    private let viewCalculator = CalculatorView()
    
    var tap: UITapGestureRecognizer?
    
    var materiaisSelecionados: [Material] = []
    
    var materiais: [Any] = []
    
    var usuario: [String:String]?
    
    var ref: DatabaseReference?
    
    var valorItens: Float = 0.00
    
    var total: Float = 0.00
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        var mat = materiais.count
        print(mat)
        print(materiais)
        viewCalculator.lblVIQuantity.text = "\(materiaisSelecionados.count)"
        viewCalculator.lblVRTotal.text = "R$ \(valorItens)"
        viewCalculator.lblVIQUantityTotalMoney.text = "R$ \(total)"
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        self.title = "Novo Projetro"
        
        pegarUserDefaults()
        
        ref = Database.database().reference(withPath: "Projeto")
        
        viewCalculator.setLayoutInView(view: self.view)
        
        addButtonsTargets()
        
        
    }
    
    func addButtonsTargets() {
        viewCalculator.btnCostsButton.addTarget(self, action: #selector(CalculatorViewController.goToCalculatorPluss), for: .touchDown)
        viewCalculator.btnVIMaterials.addTarget(self, action: #selector(CalculatorViewController.goToMaterialViewController), for: .touchDown)
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
    
    @objc func addProject(){

        guard let horasTrabalhadasString = viewCalculator.txtVCWorkedHours.text, horasTrabalhadasString.count > 0 else { return }
        
        guard let horasTrabalhadasFloat = Float(horasTrabalhadasString), horasTrabalhadasFloat > 0 else { return }
        
        guard let lucroPretendidoString = viewCalculator.txtVPProfit.text, lucroPretendidoString.count > 0 else { return }
        
        guard let lucroPretendidoFloat = Float(lucroPretendidoString), lucroPretendidoFloat > 0 else { return }
   
        if materiaisSelecionados.count == 0 {
            return
        }
        
        var projeto: Projeto?
        
            for material in materiaisSelecionados {
                materiais.append(material.toAnyObject())
            }
        
        if usuario == nil {
             projeto = Projeto(materiais: materiais, lucroPretendido: lucroPretendidoFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
        }else{
            projeto = Projeto(usuario: usuario!, materiais: materiais, lucroPretendido: lucroPretendidoFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
        }
        
        
        
        
        //AQUI DEVE PASSAR O PROJETO PARA A PROXIMA TELA, ONDE ELE VAI ESCOLHER O NOME DO PROJETO E A CATEGORIA PARA ENTÃO JOGAR NO BANCO COM AS LINHAS ABAIXO!!!
        
        guard let ref = self.ref else{return}
        
        let projetoRef = ref.childByAutoId()
        
        projetoRef.setValue(projeto?.toAnyObject())
        
        
    }
    
    @objc func abaixarTeclado() {
        viewCalculator.viewGlobal.endEditing(true)
    }
    
    @objc func goToMaterialViewController () {
        let materialsView = MaterialViewController()
        materialsView.materiaisSelecionados = self.materiaisSelecionados
        navigationController?.pushViewController(materialsView, animated: true)
    }
    
    @objc func goToCalculatorPluss() {
        let calculatorPluss = CalculatorPlussViewController()
        navigationController?.pushViewController(calculatorPluss, animated: true)
    }

}
