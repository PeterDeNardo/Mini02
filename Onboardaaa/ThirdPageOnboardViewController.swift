//
//  ThirdPageOnboardViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 29/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class ThirdPageOnboardViewController: UIViewController {

    var onboardViewController: OnboardViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarBotaoSkip()
        
        configurarBotaoBack()
        
        configurarBotaoContinuar()
        
        // Do any additional setup after loading the view.
    }
    
    func configurarBotaoSkip(){
        let botaoSkip = UIButton()
        self.view.addSubview(botaoSkip)
        botaoSkip.translatesAutoresizingMaskIntoConstraints = false
        botaoSkip.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 609).isActive = true
        botaoSkip.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 300).isActive = true
        botaoSkip.widthAnchor.constraint(equalToConstant: 40).isActive = true
        botaoSkip.heightAnchor.constraint(equalToConstant: 23).isActive = true
        botaoSkip.setTitle("Skip", for: .normal)
        botaoSkip.setTitleColor(.white, for: .normal)
        botaoSkip.setTitleShadowColor(.black, for: .normal)
        botaoSkip.addTarget(self, action: #selector(SecondPageOnboardViewController.skipButton), for: .touchUpInside)
        
        
    }
    
    @objc func skipButton(){
        let storyBoard = UIStoryboard(name: "OnboardStoryboard", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "StartButtonViewController")
        present(novoViewController, animated: true, completion: nil)
    }
    
    func configurarBotaoBack(){
        let botaoBack = UIButton()
        self.view.addSubview(botaoBack)
        botaoBack.setTitle("< Back", for: .normal)
        botaoBack.translatesAutoresizingMaskIntoConstraints = false
        botaoBack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 36).isActive = true
        botaoBack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        botaoBack.widthAnchor.constraint(equalToConstant: 70).isActive = true
        botaoBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        botaoBack.setTitleColor(.white, for: .normal)
        botaoBack.setTitleShadowColor(.black, for: .normal)
        botaoBack.addTarget(self, action: #selector(SecondPageOnboardViewController.buttonBackClicked), for: .touchUpInside)
        
    }
    
    @objc func buttonBackClicked(){
        onboardViewController?.goToPreviousPage()
        
    }
    
    func configurarBotaoContinuar(){
        let botaoContinuar = UIButton()
        self.view.addSubview(botaoContinuar)
        botaoContinuar.translatesAutoresizingMaskIntoConstraints = false
        botaoContinuar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 523).isActive = true
        botaoContinuar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        botaoContinuar.widthAnchor.constraint(equalToConstant: 145).isActive = true
        botaoContinuar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        botaoContinuar.backgroundColor = UIColor.white
        botaoContinuar.layer.cornerRadius = 8
        botaoContinuar.setTitle("Continuar", for: .normal)
        botaoContinuar.setTitleColor(.black, for: .normal)
        botaoContinuar.setTitleShadowColor(.black, for: .normal)
        botaoContinuar.layer.shadowColor = UIColor.black.cgColor
        botaoContinuar.layer.shadowOffset = CGSize(width: 0, height: 3)
        botaoContinuar.layer.shadowRadius = 6
        botaoContinuar.layer.shadowOpacity = 0.3
        botaoContinuar.addTarget(self, action: #selector(SecondPageOnboardViewController.continuarButton), for: .touchUpInside)
        
    }
    @objc func continuarButton(){
        onboardViewController?.goToLastPage()
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
