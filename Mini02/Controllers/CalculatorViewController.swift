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
    
    private let viewCalculator = ViewCalculator()
    
    let myNavigationBar = MyNavigationBarController()
    
    var materiais: [Any] = []
    
    var usuario: [String:String]?
    
    var ref: DatabaseReference?
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        pegarUserDefaults()
        
        ref = Database.database().reference(withPath: "Projeto")
        
        viewCalculator.setLayoutInView(view: self.view)
        
        viewCalculator.btnCostsButton.addTarget(self, action: #selector(CalculatorViewController.goToCalculatorPluss), for: .touchUpInside)
        
        viewCalculator.btnVBAddProjects.addTarget(self, action: #selector(CalculatorViewController.addProject), for: .touchUpInside)
        
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
        
//        if materiais == nil {
//            return
//        }
        
        var projeto: Projeto?
        
        if usuario == nil{
            
            projeto = Projeto(materiais: materiais, lucroPretendido: lucroPretendidoFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "categoriaTeste", nome: "nomeTeste")
            
            
        }else{
            let nome = "Madeira"
            let teste = Material(nome : "Madeira", tipo : "Duraça", preco : 10, marca :  "Tramontina", chave : "")
            
             materiais.append(teste.toAnyObject())
            
     
         projeto = Projeto(usuario: usuario!, materiais: materiais, lucroPretendido: lucroPretendidoFloat, horasTrabalhadas: horasTrabalhadasFloat, categoria: "", nome: "" )
            
        }
        
        //AQUI DEVE PASSAR O PROJETO PARA A PROXIMA TELA, ONDE ELE VAI ESCOLHER O NOME DO PROJETO E A CATEGORIA PARA ENTÃO JOGAR NO BANCO COM AS LINHAS ABAIXO!!!
        
        guard let ref = self.ref else{return}
        
        let projetoRef = ref.childByAutoId()
        
        projetoRef.setValue(projeto?.toAnyObject())
        
        
    }
    
    @objc func goToCalculatorPluss () {
        let calculatorPluss = CalculatorPlussViewController()
        navigationController?.pushViewController(calculatorPluss, animated: true)
    }

}
