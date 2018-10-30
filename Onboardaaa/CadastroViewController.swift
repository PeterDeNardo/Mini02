//
//  CadastroViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 24/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import Foundation

class CadastroViewController: UIViewController {

    @IBOutlet weak var cadastroImageView: UIImageView!
    
    @IBAction func cadastroBackButton(_ sender: Any) {
       let storyBoard = UIStoryboard(name: "OnboardStoryBoard", bundle: nil)
       let chamarViewController = storyBoard.instantiateViewController(withIdentifier: "StartButtonViewController")
        present(chamarViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarImageView()
        configurarCadastroButton()
    }
    
    func configurarImageView(){
        cadastroImageView.layer.cornerRadius = 8
        cadastroImageView.backgroundColor = UIColor.white
    }
    
    func configurarCadastroButton(){
        let botaoCadastrar = UIButton(frame: CGRect(x: 89, y: 442, width: 184, height: 47))
        botaoCadastrar.backgroundColor = UIColor.white
        botaoCadastrar.layer.cornerRadius = 8
        botaoCadastrar.setTitle("Cadastre-se", for: .normal)
        botaoCadastrar.setTitleColor(.black, for: .normal)
        botaoCadastrar.setTitleShadowColor(.black, for: .normal)
        botaoCadastrar.layer.shadowColor = UIColor.black.cgColor
        botaoCadastrar.layer.shadowOffset = CGSize(width: 0, height: 3)
        botaoCadastrar.layer.shadowRadius = 6
        botaoCadastrar.layer.shadowOpacity = 0.3
        
        self.view.addSubview(botaoCadastrar)
        
    }

}
