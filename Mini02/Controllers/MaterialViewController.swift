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
    var materiaisSelecionados: [Material] = []
    var timer: Timer?
    var tap: UITapGestureRecognizer?

    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Adicionar Itens"
        criarTableView()
        criarSearchBar()
        addButtonsTargets()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done) ), animated: true)
        self.navigationItem.leftBarButtonItem?.action = #selector(done)
        fetchData()
        pegarUserDefaults()
        
    }
    
    func addButtonsTargets (){
        materialView.btnFour.addTarget(self, action: #selector(goToNewMaterialView), for: .touchDown)
        
        materialView.btnSearch.addTarget(self, action: #selector(listarSelecionados), for: .touchDown)
        
        materialView.btnTwo.addTarget(self, action: #selector(addMaterial), for: .touchDown
        )
        
        materialView.btnThree.addTarget(self, action: #selector(listarMeus), for: .touchDown
        )
        
        //materialView.btnTwo.addTarget(self, action: #selector(), for: .touchDown)
    }
    
    @objc func listarMeus(){
        materiaisPesquisados.removeAll()
        for material in materiais {
            if material.usuario!["id"] == usuario!["id"] {
                materiaisPesquisados.append(material)
            }
        }
        materialView.tableView.reloadData()
    }
    
    @objc func listarSelecionados(){
        materiaisPesquisados = materiaisSelecionados
        materialView.tableView.reloadData()
    }
    
    @objc func abaixarTeclado() {
        self.view.removeGestureRecognizer(tap!)
        self.materialView.viewGlobal.endEditing(true)
    }
    
    @objc func goToNewMaterialView() {
        let newMaterialsView = NewMaterialViewController()
        navigationController?.pushViewController(newMaterialsView, animated: true)
    }
  
    func criarSearchBar(){
        let searchBar:UISearchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Pesquisar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        self.materialView.viewSearchBar.addSubview(searchBar)
    }
    
    func criarTableView(){
        self.view = self.materialView.setViews()
        self.materialView.tableView.delegate = self
        self.materialView.tableView.dataSource = self
        self.materialView.tableView.rowHeight = 79
        self.materialView.tableView.allowsMultipleSelection = true
        self.materialView.tableView.allowsSelectionDuringEditing = true
        self.materialView.tableView.backgroundColor = .clear
        
        
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
    
    func calcularTotal () -> Float {
        var total:Float = 0
        for material in materiaisSelecionados {
            total = material.preco! + total
        }
        return total
    }
    
    @objc func done (){
        let calculatorVC = CalculatorViewController()
        for material in materiaisSelecionados {
            calculatorVC.materiaisSelecionados.append(material)
        }
        calculatorVC.total = calcularTotal()
        navigationController?.pushViewController(calculatorVC, animated: true)
    }
    
    @objc func addMaterial(){
        guard let linhas = materialView.tableView.indexPathsForSelectedRows else {return}
       
        for linha in linhas {
             materiaisSelecionados.append(materiaisPesquisados[linha.row])
            materialView.tableView.deselectRow(at: linha, animated: true)
        }
        
        
      
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
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        self.view.addGestureRecognizer(tap!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       abaixarTeclado()
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
        
        cell.dropShadow()
        
        
        cell.nome.text = material.nome
        cell.preco.text = "$\(material.preco!)"
        cell.tipo.text = material.tipo
        cell.marca.text = material.marca

        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}

