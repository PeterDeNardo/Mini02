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
    let animationView = LOTAnimationView(name: "empty_box")
    
   

    override func viewWillAppear(_ animated: Bool) {
        print(usuario)
        pegarUserDefaults()
        listarTodos()
        self.navigationItem.title = "Projetos"
        loginButton = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(login))
        if usuario == nil{
            loginButton?.title = "Login"
        }else{
            loginButton?.title = "Logout"
        }
        self.navigationItem.setRightBarButton((loginButton), animated: true)
        fetchData()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
        viewWillAppear(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pegarUserDefaults()
        self.view = projectsView.setViewsInLayout()
        self.projectsView.viewTableViewProjects.delegate = self
        self.projectsView.viewTableViewProjects.dataSource = self
        self.projectsView.viewTableViewProjects.rowHeight = 180
        self.projectsView.viewTableViewProjects.allowsMultipleSelection = true
        self.projectsView.viewTableViewProjects.allowsSelectionDuringEditing = true
        self.projectsView.viewTableViewProjects.backgroundColor = .clear
        self.view = projectsView.setViewsInLayout()
        fetchData()
        
        self.navigationItem.hidesBackButton = true
        
    }
    
    func animacaoSemUsuario(){
        //configurando animacao
        if usuario == nil || projetos.count == 0 {
         
            
            projectsView.viewTableViewProjects.isHidden = true
            projectsView.viewTableViewProjects.reloadData()
            
            if self.view.subviews.count < 3 {
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
            self.view = projectsView.setViewsInLayout()
            animationView.removeFromSuperview()
            projectsView.viewTableViewProjects.isHidden = false
            projectsView.viewTableViewProjects.reloadData()
            loginButton?.title = "Logout"
        }
    }
    
    @objc func login(){
        
        if usuario != nil{
            //LOGOUT
            FBSDKLoginManager.init().logOut()
            loginButton?.title = "Login"
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
            pegarUserDefaults()
            animacaoSemUsuario()
         }
        else{
            //LOGIN
            loginButton?.title = "Logout"
           
            projectsView.viewTableViewProjects.isHidden = false
            projectsView.viewTableViewProjects.reloadData()
            navigationController?.popViewController(animated: true)
            
            goToLoginViewController()
            
            viewWillAppear(true)
            
            
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
            
            self.animacaoSemUsuario()
            
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
        
        cell.projectName.text = projeto.nome
        cell.projectItens.text = "\(projeto.materiais!.count) itens"
        cell.projectPrice.text = "R$ \(projeto.total)"
        cell.projectDate.text = "\(projeto.data!)"
        cell.projectHour.text = "\(projeto.hora!) H"
        
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}
