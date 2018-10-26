//
//  StartButtonViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 09/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FBSDKLoginKit
import FirebaseAuth

class StartButtonViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var profile: [String:String]?


    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var loginEmailLbl: UITextField!
    @IBOutlet weak var loginSenhaLbl: UITextField!
    
   
    @IBAction func startButton(_ sender: UIButton) {
        present(TabBarController(), animated: true, completion: nil)
    }
    
   
    
    func fazerBotaoFacebook(){
        //botao de login facebook
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        loginButton.readPermissions = ["email","public_profile"]
        loginButton.delegate = self
        
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //saber se está logado
        verificarDadosPerfilFacebook()
        
        fazerBotaoFacebook()
        
        configurarBotaoCadastro()
        
        configurarLoginEmailLbl()
        
        configurarLoginSenhaLbl()
        
        configurarLoginImageView()
        
        configurarBotaoEntrar()
        

        // Do any additional setup after loading the view.
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
    func setUserDefaults(){
        let defaults = UserDefaults.standard
        
        defaults.set(self.profile!["name"], forKey: "nome")
        defaults.set(self.profile!["email"], forKey: "email")
        defaults.set(self.profile!["id"], forKey: "id")
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        
        
        verificarDadosPerfilFacebook()
        
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                return
            }
        }
        
         present(TabBarController(), animated: true, completion: nil)
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    
    
    func verificarDadosPerfilFacebook(){
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "name, email"]).start {
            (connection, result, err) in
            if(err == nil){
                self.profile = (result as! [String:String])
                self.setUserDefaults()
            }
            else
            {
                self.profile = nil
            }
        }
        
    }
    
    func configurarBotaoCadastro(){
        
        let botaoCadastro = UIButton(frame: CGRect(x: 96, y: 434, width: 184, height: 47))
        
        botaoCadastro.layer.cornerRadius = 8
        botaoCadastro.backgroundColor = .white
        botaoCadastro.setTitle("Cadastre-se", for: .normal)
        botaoCadastro.setTitleColor(.black, for: .normal)
        botaoCadastro.setTitleShadowColor(.black, for: .normal)
        botaoCadastro.layer.shadowColor = UIColor.black.cgColor
        botaoCadastro.layer.shadowOffset = CGSize(width: 0, height: 3)
        botaoCadastro.layer.shadowRadius = 6
        botaoCadastro.layer.shadowOpacity = 0.3
        botaoCadastro.addTarget(self, action: #selector(StartButtonViewController.buttonClicked), for: .touchUpInside)
        
        self.view.addSubview(botaoCadastro)
    }
    
    @objc func buttonClicked(){
        let storyBoard = UIStoryboard(name: "OnboardStoryboard", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "CadastroViewController")
        present(novoViewController, animated: true, completion: nil)
    }
    
    func configurarLoginEmailLbl(){
        loginEmailLbl.placeholder = "Digite seu e-mail aqui"
        loginEmailLbl.backgroundColor = UIColor.white
    }
    func configurarLoginSenhaLbl(){
        loginSenhaLbl.placeholder = "Digite sua senha aqui"
    }
    
    func configurarLoginImageView(){
        loginImageView.backgroundColor = UIColor.white
        loginImageView.layer.cornerRadius = 8
    }
    
    func configurarBotaoEntrar(){
        let botaoEntrar = UIButton(frame: CGRect(x: 96, y: 280, width: 184, height: 47))
        botaoEntrar.backgroundColor = UIColor.white
        botaoEntrar.layer.cornerRadius = 8
        botaoEntrar.setTitle("Entrar", for: .normal)
        botaoEntrar.setTitleColor(.black, for: .normal)
        botaoEntrar.setTitleShadowColor(.black, for: .normal)
        botaoEntrar.layer.shadowColor = UIColor.black.cgColor
        botaoEntrar.layer.shadowOffset = CGSize(width: 0, height: 3)
        botaoEntrar.layer.shadowRadius = 6
        botaoEntrar.layer.shadowOpacity = 0.3
        
        self.view.addSubview(botaoEntrar)
        
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
