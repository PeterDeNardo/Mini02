//
//  MaterialViewController.swift
//  Mini02
//
//  Created by Gabriel Sousa on 10/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class MaterialViewController: UIViewController {
    
    var pesquisaTxt = ""
    var materialView = MaterialView()
    var ref: DatabaseReference? = Database.database().reference(withPath: "Material")
    var tableView: UITableView!
    var usuario: [String:String]?
    var materiais: [Material] = []
    var materiaisPesquisados: [Material] = []
    var timer: Timer?
  
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        criarTableView()
        criarSearchBar()
        self.view.addGestureRecognizer(tap)
        fetchData()
        pegarUserDefaults()
    }
    
    
    @objc func abaixarTeclado() {
        self.materialView.viewGlobal.endEditing(true)
    }
    
    
    func criarSearchBar(){
        let searchBar:UISearchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Pesquisar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        self.materialView.viewFolderButtons.addSubview(searchBar)
    }
    
    func criarTableView(){
        self.view = self.materialView.createViews()
        self.materialView.tableView.delegate = self
        self.materialView.tableView.dataSource = self
        
    }
    
    
    func pesquisar(){

        materiaisPesquisados.removeAll()
        
        pesquisaTxt = pesquisaTxt.uppercased()
        
        for material in materiais {
            
            if (material.nome?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.marca?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.tipo?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
        }
        
        if pesquisaTxt == "" {
            materiaisPesquisados = materiais
        }
        
    }
    
    func pegarUserDefaults(){
        
        let defaults = UserDefaults.standard
        
        usuario = [
            "nome" : defaults.string(forKey: "nome"),
            "email" : defaults.string(forKey: "email"),
            "id" : defaults.string(forKey: "id")
            ] as? [String : String]
        
    }
    
    @objc private func fetchData(){
        
        guard let ref = self.ref else {
            print(">>")
            return}
        
        ref.observe(.value) { (DataSnapshot) in
            
            var materiais: [Material] = []
            
            for child in DataSnapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let material = Material(snapshot: snapshot){
                    materiais.append(material)
                }
            }
            
            self.materiais = materiais
            
            self.pesquisar()
            
     
            
            self.materialView.tableView.reloadData()
            
        }
        
    }
    
}

extension MaterialViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiaisPesquisados.count
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        view.endEditing(true)
        self.materialView.viewFolderButtons.endEditing(true)
         self.materialView.tableView.endEditing(true)
        self.materialView.viewFolder.endEditing(true)
        self.materialView.viewGlobal.endEditing(true)
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate() //cancels out previous Timers
        pesquisaTxt =  searchBar.text ?? " "
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fetchData), userInfo: nil, repeats: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        abaixarTeclado()
    }
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdendifier = "cell"

        self.materialView.tableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! MaterialTableViewCell
  
        let material = materiaisPesquisados[indexPath.row]
        
        cell.nome.text = material.nome
        cell.preco.text = "R$\(material.preco)"
        cell.tipo.text = material.tipo
        cell.marca.text = material.marca

        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}

