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
    var ref: DatabaseReference?
    var tableView: UITableView!
    var usuario: [String:String]?
    var materiais: [Material] = []
    var materiaisPesquisados: [Material] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let materialView = MaterialView()
        materialView.setViews(view: self.view)
        
        //        viewMaterial.btnSearch.addTarget(self, action: #selector(MaterialViewController.pesquisar), for: .touchUpInside)
        
        pegarUserDefaults()
        
        tableView = materialView.tableView
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80.0
        pesquisar()
    }
    
    func pesquisar(){
        
        // let pesquisa = viewMaterial.txtPesquisar.txt
        let pesquisa = ""
        
        //fetchData()
        
        
        for material in materiais {
            
            if (material.nome?.contains(pesquisa))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.marca?.contains(pesquisa))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.tipo?.contains(pesquisa))!{
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
        
        guard let ref = self.ref else {return}
        
        ref.observe(.value) { (snapshot) in
            var materiais: [Material] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let material = Material(snapshot: snapshot){
                    materiais.append(material)
                }
            }
            self.materiais = materiais
            
            self.tableView.reloadData()
            
        }
    }
    
}

extension MaterialViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialCell", for: indexPath) as! MaterialTableViewCell
        
        let material = materiais[indexPath.row]
        
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

