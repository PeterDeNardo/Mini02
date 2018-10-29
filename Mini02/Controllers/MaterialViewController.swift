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
    let cellReuseIdendifier = "cell"

    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        desativarTodosOsFiltros()
        materialView.btnVisualThree.isSelected = true
        
        if materiaisSelecionados.count > 0 {
            materialView.lblSelectMaterials.text = "\(materiaisSelecionados.count) itens selecionados"
            desativarTodosOsFiltros()
            esconderBotaoAdd()
            listarSelecionados()
            listarTodos()
        }
         else {
            materialView.lblSelectMaterials.text = "Nenhum item selecionado"
            esconderBotaoAdd()
            listarTodos()
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
        addGesture()
        
       
        self.materialView.tableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        self.materialView.viewSelectedTableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
    }
    
 
    
    func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MaterialViewController.activeModal(_:)))
        materialView.viewSelected.addGestureRecognizer(gesture)
    }
    
    @objc func activeModal(_ sender:UITapGestureRecognizer){
        if materiaisPreSelecionados.count == 0 {
            if self.materialView.viewSelected.frame.origin.y > 400{
                UIView.animate(withDuration: 1, animations: {
                    self.materialView.viewSelected.frame.origin.y -= 415
                    self.materialView.viewSelectedBlur.backgroundColor = UIColor.black.withAlphaComponent(0.4)
                    self.materialView.viewSelectedBlur.isUserInteractionEnabled = true
                }, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: materialView.viewSelectedBlur) else { return }
        if materialView.viewSelectedBlur.frame.contains(location) && materialView.viewSelectedBlur.isUserInteractionEnabled == true {
            UIView.animate(withDuration: 1, animations: {
                self.materialView.viewSelected.frame.origin.y += 415
                self.materialView.viewSelectedBlur.backgroundColor = .clear
                self.materialView.viewSelectedBlur.isUserInteractionEnabled = false
            }, completion: nil)
        } else {
        }
    }
    
    func mostrarBotaoAdd(){
        if materiaisPreSelecionados.count < 1 {
            UIView.animate(withDuration: 1, animations: {
                self.materialView.viewSelected.frame.origin.y -= 26
            }, completion: nil)
        }

//        if !materialView.btnSearch.isSelected {
//
//        }
        materialView.btnAddMaterial.isHidden = false
        materialView.btnAddMaterial.isEnabled = true
    }
    
    func esconderBotaoAdd(){
        UIView.animate(withDuration: 1, animations: {
            self.materialView.viewSelected.frame.origin.y += 26
        }, completion: nil)
     
        materiaisPreSelecionados.removeAll()
        materialView.btnAddMaterial.isHidden = true
        materialView.btnAddMaterial.isEnabled = false
    }
    
    func addButtonsTargets (){
        materialView.btnVisualThree.addTarget(self, action: #selector(listarTodos), for: .touchDown)
    
       // materialView.btnSearch.addTarget(self, action: #selector(listarSelecionados), for: .touchDown)
        
        materialView.btnAddMaterial.addTarget(self, action: #selector(addMaterial), for: .touchDown)
        
        //materialView.btnTwo.addTarget(self, action: #selector(goToNewMaterialView), for: .touchDown)
        
        materialView.btnVisualTwo.addTarget(self, action: #selector(listarMeus), for: .touchDown
        )
        

    }
    
    func desativarTodosOsFiltros(){
        materialView.btnVisualThree.isSelected = false
        materialView.btnVisualTwo.isSelected = false
        //materialView.btnSearch.isSelected = false
    }
    
    @objc func listarMeus(){
    
        materialView.viewFolderButtonsFront.image = UIImage(named: "SearchButton3")
        
        desativarTodosOsFiltros()
        
        materialView.btnVisualTwo.isSelected = true
        
        if usuario == nil {
            return
        }
        
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
        
        materialView.viewSelectedTableView.reloadData()
        
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
        
        materialView.viewFolderButtonsFront.image = UIImage(named: "SearchButton1")
        
        desativarTodosOsFiltros()
        
        materialView.btnVisualThree.isSelected = true
        
        materiaisPesquisados = materiais
        
        materialView.tableView.reloadData()
        
    }
  
    func criarSearchBar(){
        let searchBar = materialView.searchBar
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Pesquisar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        self.materialView.viewFolderSearchBar.addSubview(searchBar)
    }
    
    func criarTableView(){
        
        self.view = self.materialView.setViews()
       // self.materialView.tableView = tableVC.tableView
        self.materialView.tableView.delegate = self
        self.materialView.tableView.dataSource = self
        self.materialView.tableView.rowHeight = 79
        self.materialView.tableView.allowsMultipleSelection = true
        self.materialView.tableView.allowsSelectionDuringEditing = true
        self.materialView.tableView.backgroundColor = .clear
        self.materialView.tableView.tag = 1
        
        self.materialView.viewSelectedTableView.delegate = self
        self.materialView.viewSelectedTableView.dataSource = self
        self.materialView.viewSelectedTableView.rowHeight = 79
        self.materialView.viewSelectedTableView.allowsMultipleSelection = true
        self.materialView.viewSelectedTableView.allowsSelectionDuringEditing = true
        self.materialView.viewSelectedTableView.tag = 2
       
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
            
            //selecionarTodasAsRows()
            materialView.viewSelectedTableView.reloadData()
            
        }
        
    }
    
    @objc func pesquisar(){

        materiaisPesquisados.removeAll()
        
        pesquisaTxt = pesquisaTxt.uppercased()
        
        if materialView.btnVisualTwo.isSelected {
            
            pesquisarMeus()
            
            if pesquisaTxt == "" {
                listarMeus()
            }
            
        }
            
//        if materialView.btnSearch.isSelected {
//
//            pesquisarSelecionados()
//
//            if pesquisaTxt == "" {
//               listarSelecionados()
//            }
//
//        }
        
        if materialView.btnVisualThree.isSelected {
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
         calculatorVC.valorItens = calcularTotal()
    }
    
    @objc func addMaterial(){
        for material in materiaisPreSelecionados {
            materiaisSelecionados.append(material)
        }
        materialView.lblSelectMaterials.text = "\(materiaisSelecionados.count) itens selecionados"
        desativarTodosOsFiltros()
        listarSelecionados()
        self.materialView.tableView.reloadData()
        esconderBotaoAdd()
        

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
    
}

extension MaterialViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       mostrarBotaoAdd()
       materiaisPreSelecionados.append(materiaisPesquisados[indexPath.row])
        materialView.btnAddMaterial.setTitle("\((materiaisPreSelecionados.count)) itens selecionados", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
        return materiaisPesquisados.count
        }else{
            return materiaisSelecionados.count
        }
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
        
        //listar selecionados
//        if materialView.btnSearch.isSelected {
//            var i = 0
//
//            while i < materiaisSelecionados.count {
//
//                if materiaisSelecionados[i].chave == materiaisPesquisados[indexPath.row].chave{
//                    materiaisSelecionados.remove(at: i)
//                    materiaisPesquisados.remove(at: indexPath.row)
//                    break
//                }
//                i = i + 1
//
//            }
//
//            self.materialView.tableView.reloadData()
//            self.selecionarTodasAsRows()
//        }
        
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! MaterialTableViewCell
        
        
        if tableView.tag == 1 {
            
        let material = materiaisPesquisados[indexPath.row]
        
        cell.dropShadow()
        
        cell.nome.text = material.nome
        cell.preco.text = "$\(material.preco!)"
        cell.tipo.text = material.tipo
        cell.marca.text = material.marca
        
        return cell
        }
        else{
            
            let material = materiaisSelecionados[indexPath.row]
            
            cell.dropShadow()
            
            cell.nome.text = material.nome
            cell.preco.text = "$\(material.preco!)"
            cell.tipo.text = material.tipo
            cell.marca.text = material.marca
            
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
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
    
}

