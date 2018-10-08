//
//  ViewController.swift
//  TesteMini2
//
//  Created by Gabriel Sousa on 18/09/2018.
//  Copyright © 2018 Gabriel Sousa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FBSDKLoginKit
import GoogleSignIn
import FirebaseAuth


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {
    
    var profile: [String:String]?
    var profileNome: String?
    var profileId: String?
    var profileEmail: String?
    private let viewLogin = ViewLogin()
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var senhaTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        
        viewLogin.setLayoutInView(view: self.view)
        
        verificarDadosPerfilFacebook()
        
        if profile == nil{
            
        }
        
        if profile == nil{
            viewLogin.nome.text = "Anônimo"
        }else{
            viewLogin.nome.text = profile!["name"]
        }
        
        fazerBotaoFacebook()
        
        fazerBotaoGoogle()
        
        super.viewDidLoad()
    }
    

    
    func fazerBotaoFacebook(){
        //botao de login facebook
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        loginButton.readPermissions = ["email","public_profile"]
        loginButton.delegate = self
    }
    
    func fazerBotaoGoogle(){
        //botao de login google
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 50 + 66, width: view.frame.width - 32, height: 50)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        viewLogin.nome.text = "Ninguém"
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
    
    @IBAction func login(_ sender: Any) {
        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 32, height: 50)
        
    }
    
    @IBAction func loginEmail(_ sender: Any) {
        
        guard let email = emailTextField.text, let senha = senhaTextField.text, email.count > 0, senha.count > 0
            else { return }
        
        Auth.auth().signIn(withEmail: email, password: senha) { (user, error) in
            if let error = error, user == nil {
                
                let alert = UIAlertController(title: "Erro", message: "Usuario ou senha inválidos", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }else{
                let dic: [String:String] = ["name": email, "email": email, "id": "123"]
                self.profile = dic
                self.setUserDefaults()
//                self.irParaTelaChat()
            }
        }
        
        
    }
    @IBAction func cadastrar(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Cadastrar", message: "Cadastra aí que o bagulho é louco", preferredStyle: .alert)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        let salvar = UIAlertAction(title: "Salvar", style: .default) { _ in
            
            guard let email = alert.textFields?[0], let senha = alert.textFields?[1]
                else { return }
            
            guard let emailString = email.text, let senhaString = senha.text
                else{ return }
            
            Auth.auth().createUser(withEmail: emailString, password: senhaString, completion: { (user, error) in
                if error == nil{
                    Auth.auth().signIn(withEmail: emailString, password: senhaString)
                }
            })
        }
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "E-mail"
        }
        alert.addTextField { senha in
            senha.placeholder = "Senha"
            senha.isSecureTextEntry = true
        }
        
        alert.addAction(salvar)
        alert.addAction(cancelar)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func setUserDefaults(){
        let defaults = UserDefaults.standard
        
        defaults.set(self.profile!["name"], forKey: "nome")
        defaults.set(self.profile!["email"], forKey: "email")
        defaults.set(self.profile!["id"], forKey: "id")
        
    }
    
    func verificarDadosPerfilFacebook(){
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "name, email"]).start {
            (connection, result, err) in
            if(err == nil){
                
                self.profile = (result as! [String:String])
                self.viewLogin.nome.text = self.profile!["name"]
                self.setUserDefaults()
                
            }
            else
            {
                self.profile = nil
            }
        }
        
        
    }
    
//    func irParaTelaChat(){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "ChatViewController")
//        self.present(novoViewController, animated: true, completion: nil)
//
//    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        
        
        verificarDadosPerfilFacebook()
        
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                return
            }
        }
        
//        irParaTelaChat()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

