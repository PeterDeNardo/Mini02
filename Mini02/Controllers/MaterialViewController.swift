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
    
    // var viewMaterial = ViewMaterial()
    var pesquisaTxt = ""
    var materialView = MaterialView()
    var ref: DatabaseReference? = Database.database().reference(withPath: "Material")
    var tableView: UITableView!
    var usuario: [String:String]?
    var materiais: [Material] = []
    var materiaisPesquisados: [Material] = []
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        pegarUserDefaults()
        //        viewMaterial.btnSearch.addTarget(self, action: #selector(MaterialViewController.pesquisar), for: .touchUpInside)
    }
    
    
    func pesquisar(){

        materiaisPesquisados.removeAll()
        
        for material in materiais {
            
            if (material.nome?.contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.marca?.contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.tipo?.contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
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
    
    private func fetchData(){
        
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
            
            
            let searchBar:UISearchBar = UISearchBar()
            searchBar.searchBarStyle = UISearchBar.Style.prominent
            searchBar.placeholder = " Search..."
            searchBar.sizeToFit()
            searchBar.isTranslucent = false
            searchBar.backgroundImage = UIImage()
            searchBar.delegate = self
            
            self.view = self.materialView.createViews()
            self.materialView.viewFolderButtons.addSubview(searchBar)
            self.materialView.tableView.delegate = self
            self.materialView.tableView.dataSource = self
            
        }
        
    }
    
}

extension MaterialViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(materiaisPesquisados.count)
        return materiaisPesquisados.count
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        pesquisaTxt = textSearched
         fetchData()
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

