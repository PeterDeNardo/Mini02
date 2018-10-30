//
//  FirstPageOnboardViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 29/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class FirstPageOnboardViewController: UIViewController {

    var onboardViewController: OnboardViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarBotaoSkip()
        
        configurarBotaoContinuar()

        // Do any additional setup after loading the view.
    }
    
    func configurarBotaoSkip(){
        let botaoSkip = UIButton(frame: CGRect(x: 303, y: 611, width: 37, height: 21))
        botaoSkip.setTitle("Skip", for: .normal)
        botaoSkip.setTitleColor(.white, for: .normal)
        botaoSkip.setTitleShadowColor(.black, for: .normal)
        botaoSkip.addTarget(self, action: #selector(FirstPageOnboardViewController.skipButton), for: .touchUpInside)
        
        self.view.addSubview(botaoSkip)
        
    }
    
    @objc func skipButton(){
        let storyBoard = UIStoryboard(name: "OnboardStoryboard", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "StartButtonViewController")
        present(novoViewController, animated: true, completion: nil)
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
