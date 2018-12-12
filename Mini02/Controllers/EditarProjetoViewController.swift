//
//  NewProjectViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Lottie

class EditarProjetoViewController: UIViewController, UITextFieldDelegate{
    
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
    
    var editando = false
    
    var projeto: Projeto?
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        setLabels()
        setInputs()
        verificarInputs()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.title = "\(projeto!.nome!)"
        viewCalculator.btnVBAddProjects.setTitle("Editar", for: .normal)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.view = viewCalculator.setLayoutInView()
        
        addButtonsTargets()
        
        addDelegateToTxtFields()
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    func setInputs(){
        viewCalculator.txtInfBWorkedHours.text = "\(projeto!.horasTrabalhadas!)"
        viewCalculator.txtInfBExternalCosts.text = "\(projeto!.custosExtras!)"
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
        
        viewCalculator.btnIBMaterials.addTarget(self, action: #selector(goToMaterialViewController), for: .touchDown)
        viewCalculator.btnVBAddProjects.addTarget(self, action: #selector(updateProject), for: .touchDown)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        self.view.addGestureRecognizer(tap!)
        
        let backbutton = UIButton(type: .custom)
        backbutton.setTitle("Voltar", for: .normal)
        backbutton.setTitleColor(.blue , for: .normal)
        backbutton.addTarget(self, action: #selector(voltar), for: .touchDown)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
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
            if textField == viewCalculator.txtInfBWorkedHours{
                horasTrabalhadas = 0
                setLabels()
                
            }
            
            if textField == viewCalculator.txtInfBExternalCosts{
                custosExtras = 0
                setLabels()
                
            }
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
    
    @objc func voltar(){
        let projectsVC = ProjectsViewController()
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.pushViewController(projectsVC, animated: false)
        
    }
    
    @objc func updateProject(){
        
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
        
        
        let ref = Database.database().reference().child("Projeto").child(projeto!.chave!)
        
        ref.updateChildValues(
            ["custosExtras": custosExtrasFloat,
             "horasTrabalhadas": horasTrabalhadasFloat,
             "materiais": materiais,
             "total": valorItens + custosExtrasFloat,
            ]
        )
        
        //animacao
        let animationView = LOTAnimationView(name: "done")
        animationView.animationSpeed = CGFloat(1.3)
        blur()
        self.view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        animationView.play{ (finished) in
            self.goToProjectsViewController()
        }
        

    }
    
    func goToProjectsViewController(){
        let projectsVC = ProjectsViewController()
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.pushViewController(projectsVC, animated: false)
    }
    
    func blur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    @objc func abaixarTeclado() {
        viewCalculator.viewGlobal.endEditing(true)
    }
    
    @objc func goToMaterialViewController () {
        
        let materialsView = MaterialViewController()
        
        materialsView.projeto = projeto
        
        materialsView.custosExtras = projeto!.custosExtras ?? 0
        
        materialsView.horasTrabalhadas = projeto!.horasTrabalhadas!
        
        materialsView.valorItens = valorItens
        
        materialsView.editando = true
        
        materialsView.materiaisSelecionados = self.materiaisSelecionados
        navigationController?.pushViewController(materialsView, animated: true)
    }
    
    
    
    
}
