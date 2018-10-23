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
    
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
