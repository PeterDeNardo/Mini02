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
        
        //addDelegateTxtFields()
        
       
        // Do any additional setup after loading the view.
    }
    
//    func addDelegateTxtFields(){
//        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
//        self.view.addGestureRecognizer(tap!)
//        
//        //viewCalculatorPluss.txtCFFrequency.delegate = self
//        //viewCalculatorPluss.txtFEDaysWork.delegate = self
//        //viewCalculatorPluss.txtCPBTotal.delegate = self
//
//    }
//    
//    @objc func abaixarTeclado() {
//        viewCalculatorPluss.viewGlobal.endEditing(true)
//    }
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.text?.removeAll()
//        textField.keyboardType = .numberPad
//    }
//    
//    func setLabels(){
//        viewCalculatorPluss.lblEFTotalResult.text = "R$ \(total)"
//        viewCalculatorPluss.lblEFTotalByHourResult.text = "R$ \(total/diasTrabalhados)"
//    }
//    
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//        if textField.text == "" {
//            textField.text = "0"
//            
//            if textField == viewCalculatorPluss.txtCPBTotal{
//                
//                total = 0
//                setLabels()
//                
//            }
//            
//            if textField == viewCalculatorPluss.txtFEDaysWork{
//                
//                diasTrabalhados = 0
//                setLabels()
//                
//            }
////
////            if textField == viewCalculatorPluss.txtCFFrequency{
////
////                frequencia = 0
////                setLabels()
////
////            }
////
////            return
////        }
////
////        if textField == viewCalculatorPluss.txtCFFrequency{
////
////            frequencia = Float(textField.text!)!
////            setLabels()
////
////        }
////
//        if textField == viewCalculatorPluss.txtFEDaysWork{
//            diasTrabalhados = Float(textField.text!)!
//            setLabels()
//        }
//        
//        if textField == viewCalculatorPluss.txtCPBTotal{
//            total = Float(textField.text!)!
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
//        if textField == viewCalculatorPluss.txtCPBTotal{
//            guard let total = Float(string), total > 0 else { return true }
//            
//            var a = "\(Int(total))"
//            var b = "\(a)\(string)"
//            
//            if total <= 0{
//                b = string
//            }
//            
//            self.total = Float(Int(b)!)
//            setLabels()
//        
//            return true
//        }
//        
//        if textField == viewCalculatorPluss.txtFEDaysWork{
//            guard let diasTrabalhados = Float(string), diasTrabalhados > 0 else { return true }
//            
//            var a = "\(Int(diasTrabalhados))"
//            var b = "\(a)\(string)"
//            
//            if diasTrabalhados <= 0{
//                b = string
//            }
//            
//            self.diasTrabalhados = Float(Int(b)!)
//            setLabels()
//
//            return true
//        }
//        
////        if textField == viewCalculatorPluss.txtCFFrequency{
////            guard let frequencia = Float(string), frequencia > 0 else { return true }
////
////            var a = "\(Int(frequencia))"
////            var b = "\(a)\(string)"
////
////            if frequencia <= 0{
////                b = string
////            }
////
////            self.frequencia = Float(Int(b)!)
////            setLabels()
////            return true
////        }
//        return false
//    }
    

  
}
