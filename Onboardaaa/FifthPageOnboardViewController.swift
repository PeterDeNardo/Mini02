//
//  FifthPageOnboardViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 29/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class FifthPageOnboardViewController: UIViewController {

    // reference to the PageViewController
    var onboardViewController: OnboardViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarBotaoSkip()
        
        configurarBotaoBack()
        
        configurarBotaoContinuar()
        
        // Do any additional setup after loading the view.
    }
    
    func configurarBotaoSkip(){
        let botaoSkip = UIButton(frame: CGRect(x: 303, y: 611, width: 37, height: 21))
        botaoSkip.setTitle("Skip", for: .normal)
        botaoSkip.setTitleColor(.white, for: .normal)
        botaoSkip.setTitleShadowColor(.black, for: .normal)
        botaoSkip.addTarget(self, action: #selector(FifthPageOnboardViewController.skipButton), for: .touchUpInside)
        
        self.view.addSubview(botaoSkip)
        
    }
    
    @objc func skipButton(){
        let storyBoard = UIStoryboard(name: "OnboardStoryboard", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "StartButtonViewControllerr")
        present(novoViewController, animated: true, completion: nil)
    }
    
    func configurarBotaoBack(){
        let botaoBack = UIButton(frame: CGRect(x: 15, y: 36, width: 70, height: 40))
        botaoBack.setTitle("< Back", for: .normal)
        botaoBack.setTitleColor(.white, for: .normal)
        botaoBack.setTitleShadowColor(.black, for: .normal)
        botaoBack.addTarget(self, action: #selector(FifthPageOnboardViewController.buttonBackClicked), for: .touchUpInside)
        
        self.view.addSubview(botaoBack)
    }
    
    @objc func buttonBackClicked(){
        onboardViewController?.goToPreviousPage()
        
    }
    
    func configurarBotaoContinuar(){
        let botaoContinuar = UIButton(frame: CGRect(x: 89, y: 500, width: 184, height: 47))
        botaoContinuar.backgroundColor = UIColor.white
        botaoContinuar.layer.cornerRadius = 8
        botaoContinuar.setTitle("Continuar", for: .normal)
        botaoContinuar.setTitleColor(.black, for: .normal)
        botaoContinuar.setTitleShadowColor(.black, for: .normal)
        botaoContinuar.layer.shadowColor = UIColor.black.cgColor
        botaoContinuar.layer.shadowOffset = CGSize(width: 0, height: 3)
        botaoContinuar.layer.shadowRadius = 6
        botaoContinuar.layer.shadowOpacity = 0.3
        botaoContinuar.addTarget(self, action: #selector(FirstPageOnboardViewController.continuarButton), for: .touchUpInside)
        
        self.view.addSubview(botaoContinuar)
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
