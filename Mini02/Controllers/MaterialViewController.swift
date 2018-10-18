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
    let calculatorVC = CalculatorViewController()
    var materialView = MaterialView()
    var ref: DatabaseReference? = Database.database().reference(withPath: "Material")
    var tableView: UITableView!
    var usuario: [String:String]?
    var materiais: [Material] = []
    var materiaisPesquisados: [Material] = []
    var materiaisSelecionados: [Material] = []
    var materiaisPreSelecionados: [Material] = []
    var timer: Timer?
    var tap: UITapGestureRecognizer?

    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        desativarTodosOsFiltros()
        materialView.btnFour.isSelected = true
        
        if materiaisSelecionados.count > 0 {
            desativarTodosOsFiltros()
            materialView.btnSearch.isSelected = true
            esconderBotaoAdd()
            listarSelecionados()
        }
        
        if materiaisSelecionados.count == 0 {
            esconderBotaoAdd()
            listarTodos()
        }else{
           mostrarBotaoAdd()
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        if self.isMovingFromParent{
        
            done()
            self.tabBarController?.tabBar.isHidden = false
            navigationController?.pushViewController(calculatorVC, animated: false)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Adicionar Itens"
        criarTableView()
        criarSearchBar()
        addButtonsTargets()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(goToNewMaterialView) ), animated: true)
        fetchData()
        pegarUserDefaults()
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    func mostrarBotaoAdd(){
        if !materialView.btnSearch.isSelected {
        materialView.btnAddMaterial.isHidden = false
        materialView.btnAddMaterial.isEnabled = true
        }
    }
    
    func esconderBotaoAdd(){
        materiaisPreSelecionados.removeAll()
        materialView.btnAddMaterial.isHidden = true
        materialView.btnAddMaterial.isEnabled = false
    }
    
    func addButtonsTargets (){
        materialView.btnFour.addTarget(self, action: #selector(listarTodos), for: .touchDown)
    
        materialView.btnSearch.addTarget(self, action: #selector(listarSelecionados), for: .touchDown)
        
        materialView.btnAddMaterial.addTarget(self, action: #selector(addMaterial), for: .touchDown)
        
        //materialView.btnTwo.addTarget(self, action: #selector(goToNewMaterialView), for: .touchDown)
        
        materialView.btnThree.addTarget(self, action: #selector(listarMeus), for: .touchDown
        )
        

    }
    
    func desativarTodosOsFiltros(){
        materialView.btnTwo.isSelected = false
        materialView.btnFour.isSelected = false
        materialView.btnThree.isSelected = false
        materialView.btnSearch.isSelected = false
    }
    
    @objc func listarMeus(){
        
        desativarTodosOsFiltros()
        
        materialView.btnThree.isSelected = true
        
        materiaisPesquisados.removeAll()
        for material in materiais {
            if material.usuario!["id"] == usuario!["id"] {
                materiaisPesquisados.append(material)
            }
        }
        materialView.tableView.reloadData()
    }
    
    @objc func listarSelecionados(){
        desativarTodosOsFiltros()
        materialView.btnSearch.isSelected = true
        materiaisPesquisados = materiaisSelecionados
        materialView.tableView.reloadData()
        selecionarTodasAsRows()
        
    }
    
    func selecionarTodasAsRows(){
        
        var i = 0
        while i < materiaisPesquisados.count {
            materialView.tableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: UITableView.ScrollPosition.middle)
            i = i + 1
        }
        
    }
    
    @objc func abaixarTeclado() {
        self.view.removeGestureRecognizer(tap!)
        self.materialView.viewGlobal.endEditing(true)
    }
    
    @objc func goToNewMaterialView() {
        let newMaterialsView = NewMaterialViewController()
        navigationController?.pushViewController(newMaterialsView, animated: true)
    }
    
    @objc func listarTodos(){
        
        desativarTodosOsFiltros()
        
        materialView.btnFour.isSelected = true
        
        materiaisPesquisados = materiais
        
        materialView.tableView.reloadData()
        
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
        
        let tableVC = MaterialTableViewController()
        
        self.view = self.materialView.setViews()
       // self.materialView.tableView = tableVC.tableView
        self.materialView.tableView.delegate = self
        self.materialView.tableView.dataSource = self
        self.materialView.tableView.rowHeight = 79
        self.materialView.tableView.allowsMultipleSelection = true
        self.materialView.tableView.allowsSelectionDuringEditing = true
        self.materialView.tableView.backgroundColor = .clear
        
        
        
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
        
        materialView.tableView.reloadData()
        
    }

    func pesquisarSelecionados(){
        
        materiaisPesquisados.removeAll()
        
        for material in materiaisSelecionados {
            
            if (material.nome?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
            else if (material.marca?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
                
            else if (material.tipo?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.append(material)
            }
            
            selecionarTodasAsRows()
            
        }
        
    }
    
    @objc func pesquisar(){

        materiaisPesquisados.removeAll()
        
        pesquisaTxt = pesquisaTxt.uppercased()
        
        if materialView.btnThree.isSelected {
            
            pesquisarMeus()
            
            if pesquisaTxt == "" {
                listarMeus()
            }
            
        }
            
        if materialView.btnSearch.isSelected {
            
            pesquisarSelecionados()
            
            if pesquisaTxt == "" {
               listarSelecionados()
            }
            
        }
        
        if materialView.btnFour.isSelected {
        //pesquisar sem filtros
        pesquisarTodos()
            
            if pesquisaTxt == "" {
                listarTodos()
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
    
    func calcularTotal () -> Float {
        var total:Float = 0
        for material in materiaisSelecionados {
            total = material.preco! + total
        }
        return total
    }
    
    @objc func done (){
        
        for material in materiaisSelecionados {
            calculatorVC.materiaisSelecionados.append(material)
        }
         calculatorVC.total = calcularTotal()
    }
    
    @objc func addMaterial(){
        
        if !materialView.btnSearch.isSelected{
            for material in materiaisPreSelecionados {
                materiaisSelecionados.append(material)
            }
        desativarTodosOsFiltros()
        materialView.btnSearch.isSelected = true
        listarSelecionados()
        esconderBotaoAdd()

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
            
            if self.materialView.btnSearch.isSelected {
                self.selecionarTodasAsRows()
            }
            
        }
        
    }
    
}

extension MaterialViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       mostrarBotaoAdd()
       materiaisPreSelecionados.append(materiaisPesquisados[indexPath.row])
        materialView.btnAddMaterial.setTitle("\((materiaisPreSelecionados.count)) itens selecionados", for: .normal)
    }
    
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

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if tableView.indexPathsForSelectedRows == nil {
            esconderBotaoAdd()
        }
        else {
            
            var i = 0
            
            while i < materiaisPreSelecionados.count {
                
                if materiaisPreSelecionados[i].chave == materiaisPesquisados[indexPath.row].chave{
                    materiaisPreSelecionados.remove(at: i)
//                    materiaisPreSelecionados.remove(at: indexPath.row)
                    materialView.btnAddMaterial.setTitle("\((materiaisPreSelecionados.count)) itens selecionados", for: .normal)
                    break
                }
                i = i + 1
                
            }
        }
        
        
        if materialView.btnSearch.isSelected {
            var i = 0
            
            while i < materiaisSelecionados.count {
                
                if materiaisSelecionados[i].chave == materiaisPesquisados[indexPath.row].chave{
                    materiaisSelecionados.remove(at: i)
                    materiaisPesquisados.remove(at: indexPath.row)
                    break
                }
                i = i + 1
                
            }
            
            self.materialView.tableView.reloadData()
            self.selecionarTodasAsRows()
        }
        
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
        
        if !materialView.btnSearch.isSelected {
            for material in materiaisPreSelecionados {

                if materiaisPesquisados[indexPath.row].chave == material.chave{
                     tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
                }

            }
        }
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}

