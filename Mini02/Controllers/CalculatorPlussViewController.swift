//
//  ProjectCreatePlussViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 08/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class CalculatorPlussViewController: UIViewController, UITextFieldDelegate {

    private let viewCalculatorPluss = CalculatorPlussView()
    
    var total: Float = 0.0
    
    var diasTrabalhados: Float = 0.0
    
    var frequencia: Float = 0.0
    
    var tap: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Custos extras"
        
        self.view = viewCalculatorPluss.setViews()
        
        addDelegateTxtFields()
        
       
        // Do any additional setup after loading the view.
    }
    
    func addDelegateTxtFields(){
        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        self.view.addGestureRecognizer(tap!)
        
        viewCalculatorPluss.txtCFFrequency.delegate = self
        viewCalculatorPluss.txtCFDaysWork.delegate = self
        viewCalculatorPluss.txtCPBTotal.delegate = self

    }
    
    @objc func abaixarTeclado() {
        viewCalculatorPluss.viewGlobal.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text?.removeAll()
        textField.keyboardType = .numberPad
    }
    
    func setLabels(){
        viewCalculatorPluss.lblEFTotalResult.text = "R$ \(total)"
        viewCalculatorPluss.lblEFTotalByHourResult.text = "R$ \(total/diasTrabalhados)"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == viewCalculatorPluss.txtCPBTotal{
            guard let total = Float(string), total > 0 else { return true }
            self.total = total
            setLabels()
            return true
        }
        
        if textField == viewCalculatorPluss.txtCFDaysWork{
            guard let diasTrabalhados = Float(string), diasTrabalhados > 0 else { return true }
            self.diasTrabalhados = diasTrabalhados
            setLabels()
            return true
        }
        
        if textField == viewCalculatorPluss.txtCFFrequency{
            guard let frequencia = Float(string), frequencia > 0 else { return true }
            self.frequencia = frequencia
            setLabels()
            return true
        }
        return false
    }
    

  
}
