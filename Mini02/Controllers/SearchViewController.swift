//
//  SearchViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 12/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchViewController: UIViewController, UITextFieldDelegate {
    let searchView = SearchView()
    var pesquisaTxt = ""
    var ref: DatabaseReference? = Database.database().reference(withPath: "Material")
    var tableView: UITableView!
    var usuario: [String:String]?
    var materiais: [Material] = []
    var materiaisPesquisados: [Material] = []
    var timer: Timer?
    var tap: UITapGestureRecognizer?
    let cellReuseIdendifier = "cell"
    
    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        desativarTodosOsFiltros()
        searchView.btnSearchAct.isSelected = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Adicionar Itens"
        criarTableView()
        criarSearchBar()
        addButtonsTargets()
        fetchData()
        pegarUserDefaults()
        self.searchView.tableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
       
    }
    
    func pegarUserDefaults(){
        
        let defaults = UserDefaults.standard
        
        usuario = [
            "nome" : defaults.string(forKey: "nome"),
            "email" : defaults.string(forKey: "email"),
            "id" : defaults.string(forKey: "id")
            ] as? [String : String]
    }
    
    func criarSearchBar(){
        let searchBar = searchView.searchBar
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Pesquisar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        self.searchView.viewFolderSearchBar.addSubview(searchBar)
    }
    
    func criarTableView(){
        
        self.view = self.searchView.setViews()
        self.searchView.tableView.delegate = self
        self.searchView.tableView.dataSource = self
        self.searchView.tableView.rowHeight = 79
        self.searchView.tableView.backgroundColor = .clear
    
    }
    
    func settingNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(SearchViewController.addNewMaterial)), animated: true)
        self.navigationItem.title = "Materiais"
   
    }
    
    func addButtonsTargets (){
        
        searchView.btnSearchAct.addTarget(self, action: #selector(listarTodos), for: .touchDown)
        
        searchView.btnUserMaterialsAct.addTarget(self, action: #selector(listarMeus), for: .touchDown)
        
        }
    
    func desativarTodosOsFiltros(){
        searchView.btnSearchAct.isSelected = false
        searchView.btnUserMaterialsAct.isSelected = false
    }
    
    @objc func listarMeus(){
        
        searchView.viewFolderButtonsFront.image = UIImage(named: "SearchButton2")
        
        desativarTodosOsFiltros()
        
        searchView.btnUserMaterialsAct.isSelected = true
        
        if usuario == nil {
            return
        }
        
        materiaisPesquisados.removeAll()
        
        for material in materiais {
            if material.usuario!["id"] == usuario!["id"] {
                materiaisPesquisados.append(material)
            }
        }
        
            searchView.tableView.reloadData()
    
    }

    @objc func listarTodos(){
        
        searchView.viewFolderButtonsFront.image = UIImage(named: "SearchButton1")
        
        desativarTodosOsFiltros()
        
        searchView.btnSearchAct.isSelected = true
        
        materiaisPesquisados = materiais
        
        searchView.tableView.reloadData()
        
    }
    
    @objc func pesquisar(){
        
        materiaisPesquisados.removeAll()
        
        pesquisaTxt = pesquisaTxt.uppercased()
        
        if searchView.btnUserMaterialsAct.isSelected {
            
            pesquisarMeus()
            
            if pesquisaTxt == "" {
                listarMeus()
            }
            
        }
        
        if searchView.btnSearchAct.isSelected {
            //pesquisar sem filtros
            pesquisarTodos()
            
            if pesquisaTxt == "" {
                listarTodos()
            }
        }
    }
    
    func pesquisarMeus(){
        
        for material in materiais {
            
            if (material.nome?.uppercased().contains(pesquisaTxt))! && usuario!["id"] == material.usuario!["id"]{
                materiaisPesquisados.append(material)
            }
                
            else if (material.marca?.uppercased().contains(pesquisaTxt))! && usuario!["id"] == material.usuario!["id"]{
                materiaisPesquisados.append(material)
            }
                
            else if (material.tipo?.uppercased().contains(pesquisaTxt))! && usuario!["id"] == material.usuario!["id"]{
                materiaisPesquisados.append(material)
            }
        }
        
        searchView.tableView.reloadData()
    }
    
    func pesquisarTodos(){
        
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
        
        searchView.tableView.reloadData()
        
    }
    
    @objc func abaixarTeclado() {
        self.view.removeGestureRecognizer(tap!)
        self.searchView.viewGlobal.endEditing(true)
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
            
        }
        
    }
    
    @objc func searchButtonAction() {
        searchView.viewFolderButtonsFront.image = UIImage(named: "SearchButton1")
    }
    
    @objc func userMaterialAction(){
        searchView.viewFolderButtonsFront.image = UIImage(named: "SearchButton2")
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



extension SearchViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return materiaisPesquisados.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! MaterialTableViewCell
        
        
      
            let material = materiaisPesquisados[indexPath.row]
            
            cell.tipo.delegate = self
            cell.nome.text = material.nome
            cell.preco.text = "$\(material.preco!)"
            cell.tipo.text = "1"
            cell.marca.text = material.marca
            let tipo = material.tipo?.lowercased()
            cell.imgType.image = UIImage(named: "\(tipo!)IconCor")
            
            
            return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    
    //SEARCHBAR
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
    
}
