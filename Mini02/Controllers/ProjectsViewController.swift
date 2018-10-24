//
//  ProjectsViewController.swift
//  
//
//  Created by Peter De Nardo on 17/10/18.
//

import UIKit
import FirebaseDatabase
import Lottie
import FirebaseAuth
import FBSDKLoginKit

class ProjectsViewController: UIViewController {

    let projectsView = ProjectsView()
    var ref: DatabaseReference? = Database.database().reference(withPath: "Projeto")
    var tableView: UITableView!
    var usuario: [String:String]?
    var projetos: [Projeto] = []
    var meusProjetos: [Projeto] = []
    var loginButton: UIBarButtonItem?
    
   

    override func viewWillAppear(_ animated: Bool) {
        
        pegarUserDefaults()
        listarTodos()
        loginButton = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(login))
        self.navigationItem.setRightBarButton((loginButton), animated: true)
        animacaoSemUsuario()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pegarUserDefaults()
        self.view = projectsView.setViewsInLayout()
        self.projectsView.viewTableViewProjects.delegate = self
        self.projectsView.viewTableViewProjects.dataSource = self
        self.projectsView.viewTableViewProjects.rowHeight = 150
        self.projectsView.viewTableViewProjects.allowsMultipleSelection = true
        self.projectsView.viewTableViewProjects.allowsSelectionDuringEditing = true
        self.projectsView.viewTableViewProjects.backgroundColor = .clear
        
        self.view = projectsView.setViewsInLayout()
        
        self.navigationItem.hidesBackButton = true
        
        fetchData()
        
    }
    
    func animacaoSemUsuario(){
        if usuario == nil {
            loginButton?.title = "Login"
            
            projectsView.viewTableViewProjects.isHidden = true
            projectsView.viewTableViewProjects.reloadData()
            
            if self.view.subviews.count < 3 {
                
                let animationView = LOTAnimationView(name: "empty_box")
                animationView.animationSpeed = CGFloat(1)
                self.view.addSubview(animationView)
                self.view.backgroundColor = .white
                
                animationView.translatesAutoresizingMaskIntoConstraints = false
                animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                animationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                animationView.widthAnchor.constraint(equalToConstant: 200).isActive = true
                
                animationView.play()
                animationView.loopAnimation = true
                
            }
            return
            
        }else{
            loginButton?.title = "Logout"
        }
    }
    
    @objc func login(){
        
        if usuario != nil{
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
            FBSDKLoginManager.init().logOut()
            loginButton?.title = "Login"
            pegarUserDefaults()
            animacaoSemUsuario()
            }
         }
        else{
            loginButton?.title = "Logout"
            goToLoginViewController()
        }

    }
    
    func goToLoginViewController(){
        
        let loginVC = LoginViewController()
        loginVC.VCAnterior = ProjectsViewController()
       self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    func pegarUserDefaults(){
        
        let defaults = UserDefaults.standard
        
        usuario = [
            "nome" : defaults.string(forKey: "nome"),
            "email" : defaults.string(forKey: "email"),
            "id" : defaults.string(forKey: "id")
            ] as? [String : String]
        
    }
    
    func listarTodos(){
        
        meusProjetos.removeAll()
        
        if usuario == nil {
            projectsView.viewTableViewProjects.isHidden = true
            projectsView.viewTableViewProjects.reloadData()
            return
        }
        
            for projeto in projetos {
                if projeto.usuario!["id"] == usuario!["id"] {
                    meusProjetos.append(projeto)
                }
            }
            projectsView.viewTableViewProjects.reloadData()
        
    }
    
    @objc private func fetchData(){
        
        guard let ref = self.ref else {
            print(">>")
            return}
        
        ref.observe(.value) { (DataSnapshot) in
            
            var projetos: [Projeto] = []
            
            for child in DataSnapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let projeto = Projeto(snapshot: snapshot){
                    projetos.append(projeto)
                }
            }
            
            self.projetos = projetos
            
            self.listarTodos()
            
            self.projectsView.viewTableViewProjects.reloadData()
            
        }
        
    }
    
   
    

}






extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meusProjetos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdendifier = "cell"
        self.projectsView.viewTableViewProjects.register(ProjectTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! ProjectTableViewCell
        
        if meusProjetos.count == 0 {
            projectsView.viewTableViewProjects.isHidden = true
            projectsView.viewTableViewProjects.reloadData()
            return cell
        }
        
        let projeto = meusProjetos[indexPath.row]
        
        cell.dropShadow()
        
        cell.projectName.text = projeto.nome
        cell.projectItens.text = "\(projeto.materiais!.count)"
        cell.projectPrice.text = "\(projeto.total)"
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}
