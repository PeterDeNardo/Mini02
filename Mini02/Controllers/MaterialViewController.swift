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

class MaterialViewController: UIViewController, UITextFieldDelegate {
    
    var pesquisaTxt = ""
    var editando = false
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
    var projeto: Projeto?
    var valorItens: Float = 0.00
    var custosExtras: Float = 0.00
    var lucroPretendido: Float = 0.00
    var horasTrabalhadas: Float = 0.00

    override func viewWillAppear(_ animated: Bool) {
        pegarUserDefaults()
        desativarTodosOsFiltros()
        materialView.btnFrequentes.isSelected = true
    
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
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Adicionar Itens"
        criarTableView()
        criarSearchBar()
        addButtonsTargets()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToNewMaterialView) ), animated: true)
        fetchData()
        pegarUserDefaults()
        self.tabBarController?.tabBar.isHidden = true
        addGesture()
        setInitialLayout()
        
       
        self.materialView.tableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        self.materialView.viewSelectedTableView.register(MaterialTableViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
    }
    
    func setInitialLayout() {
        materialView.btnAddMaterial.isHidden = true
        materialView.btnAddMaterial.isEnabled = false
    }
    
    func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(MaterialViewController.activeModal(_:)))
        materialView.viewSelected.addGestureRecognizer(gesture)
    }
    
    @objc func activeModal(_ sender:UITapGestureRecognizer){
        if materiaisPreSelecionados.count == 0 {
            if self.materialView.viewSelected.frame.origin.y > 400{
                materialView.setLayoutInModalIfModalAreOpened()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: materialView.viewSelectedBlur) else { return }
        if materialView.viewSelectedBlur.frame.contains(location) && materialView.viewSelectedBlur.isUserInteractionEnabled == true {
            if self.materialView.viewSelected.frame.origin.y < 400{
                materialView.setLayoutInModalIfModalAreClosed()
            } else {
                materialView.drawCellSpotligth()
                materialView.tipo.resignFirstResponder()
            }
        }
    }
    
    func mostrarBotaoAdd(){
        if materiaisPreSelecionados.count < 1 {
            materialView.setLayoutInModalIfCellAreSelected()        }

//        if !materialView.btnSearch.isSelected {
//
//        }
        materialView.btnAddMaterial.isHidden = false
        materialView.btnAddMaterial.isEnabled = true
    }
    
    func esconderBotaoAdd(){
        materialView.setLayoutInModalIfIfCellArentSelected()
        
        materiaisPreSelecionados.removeAll()
        materialView.btnAddMaterial.isHidden = true
        materialView.btnAddMaterial.isEnabled = false
    }
    
    func addButtonsTargets (){
        materialView.btnTodos.addTarget(self, action: #selector(listarTodos), for: .touchDown)
        
        materialView.btnMeus.addTarget(self, action: #selector(listarMeus), for: .touchDown)
        
        materialView.btnFrequentes.addTarget(self, action: #selector(listarFrequentes), for: .touchDown)
        
        materialView.btnAddMaterial.addTarget(self, action: #selector(addMaterial), for: .touchDown)
        
        materialView.btnDoneEdit.addTarget(self, action: #selector(editCell), for: .touchDown)

    }
    
    func desativarTodosOsFiltros(){
        materialView.btnFrequentes.isSelected = false
        materialView.btnMeus.isSelected = false
        //materialView.btnSearch.isSelected = false
    }
    
    @objc func editCell() {
        materialView.drawCellSpotligth()
        materialView.tipo.resignFirstResponder()
        populateCell()
        atualizarPreSelecionados()
    }
    
    func atualizarPreSelecionados(){
        if let indexPath = self.materialView.tableView.indexPathForSelectedRow {
            let cell = self.materialView.tableView.cellForRow(at: indexPath) as! MaterialTableViewCell
            var i = 0
            while i < materiaisPreSelecionados.count {
                if materiaisPreSelecionados[i].chave == materiaisPesquisados[indexPath.row].chave{
                    materiaisPreSelecionados[i].quantidade = Int(cell.tipo.text!)!
                    materiaisPreSelecionados[i].atualizarTotal()
                }
                i = i + 1
            }
        }
        
    }
    
    @objc func listarMeus(){
    
        materialView.viewFolderButtonsFront.image = UIImage(named: "SearchButton2")
        
        desativarTodosOsFiltros()
        
        materialView.btnMeus.isSelected = true
        
        if usuario == nil {
            return
        }
        
        materiaisPesquisados.removeAll()
        
        for material in materiais {
            if material.usuario!["id"] == usuario!["id"] {
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
        }
        
        ordenarMateriais()
        
        materialView.tableView.reloadData()
    }
    
    @objc func listarFrequentes(){
        
        materialView.viewFolderButtonsFront.image = UIImage(named: "SearchButton3")
        
        desativarTodosOsFiltros()
        
        materialView.btnFrequentes.isSelected = true
        
        if usuario == nil {
            return
        }
        
        materiaisPesquisados.removeAll()
        
        fetchDataFrequentes()
  
    }
    
    @objc func listarSelecionados(){
        
        desativarTodosOsFiltros()
        
        materialView.viewSelectedTableView.reloadData()
        
        
    }
    
    func selecionarTodasAsRows(){
        
        var i = 0
        while i < materiaisSelecionados.count {
            materialView.viewSelectedTableView.selectRow(at: IndexPath(row: i, section: 0), animated: false, scrollPosition: UITableView.ScrollPosition.middle)
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
    
    func ordenarMateriais() {
        materiaisPesquisados = materiaisPesquisados.sorted {
            if $0.tipo! != $1.tipo!{
                return $0.tipo! < $1.tipo!
            } else {
                return $0.nome! < $1.nome!
            }
            
        }
    }
    
    @objc func listarTodos(){
        
        materialView.viewFolderButtonsFront.image = UIImage(named: "SearchButton1")
        
        desativarTodosOsFiltros()
        
        materialView.btnFrequentes.isSelected = true
        
        materiaisPesquisados = materiais
        
        ordenarMateriais()
        
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
        self.materialView.tableView.delegate = self
        self.materialView.tableView.dataSource = self
        self.materialView.tableView.rowHeight = 79
        self.materialView.tableView.allowsMultipleSelection = true
        self.materialView.tableView.backgroundColor = .clear
        self.materialView.tableView.tag = 1
        
        self.materialView.viewSelectedTableView.delegate = self
        self.materialView.viewSelectedTableView.dataSource = self
        self.materialView.viewSelectedTableView.allowsMultipleSelection = true
        self.materialView.viewSelectedTableView.rowHeight = 79
        self.materialView.viewSelectedTableView.tag = 2
       
    }
    
    func pesquisarMeus(){
        
        for material in materiais {
            
            if (material.nome?.uppercased().contains(pesquisaTxt))! && usuario!["id"] == material.usuario!["id"]{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
                
            else if (material.marca?.uppercased().contains(pesquisaTxt))! && usuario!["id"] == material.usuario!["id"]{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }

            else if (material.tipo?.uppercased().contains(pesquisaTxt))! && usuario!["id"] == material.usuario!["id"]{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
        }
    }
    
    func pesquisarTodos(){

        for material in materiais {
            
            if (material.nome?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
            else if (material.marca?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
                
            else if (material.tipo?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
        }
      
    }

    func pesquisarSelecionados(){
        
        materiaisPesquisados.removeAll()
        
        for material in materiaisSelecionados {
            
            if (material.nome?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
            else if (material.marca?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
                
            else if (material.tipo?.uppercased().contains(pesquisaTxt))!{
                materiaisPesquisados.insert(material, at: materiaisPesquisados.count)
            }
            
            //selecionarTodasAsRows()
            materialView.viewSelectedTableView.reloadData()
            
        }
        
    }
    
    @objc func pesquisar(){

        materiaisPesquisados.removeAll()
        
        pesquisaTxt = pesquisaTxt.uppercased()
        
        if materialView.btnMeus.isSelected {
            
            pesquisarMeus()
            
            if pesquisaTxt == "" {
                listarMeus()
            }
            
        }
        
        if materialView.btnFrequentes.isSelected {
        //pesquisar sem filtros
        pesquisarTodos()
            
            if pesquisaTxt == "" {
                listarTodos()
            }
        }
        
        ordenarMateriais()
        
        materialView.tableView.reloadData()
        
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
            total = material.total! + total
        }
        return total
    }
    
    @objc func done (){
        
        if editando == false {
            for material in materiaisSelecionados {
            calculatorVC.materiaisSelecionados.insert(material, at: calculatorVC.materiaisSelecionados.count)
           }
        
            calculatorVC.valorItens = calcularTotal()
            self.tabBarController?.tabBar.isHidden = false
            navigationController?.pushViewController(calculatorVC, animated: false)
            
           } else {
            let editandoVC = EditarProjetoViewController()
            for material in materiaisSelecionados {
                editandoVC.materiaisSelecionados.insert(material, at: editandoVC.materiaisSelecionados.count)
            }
            
            editandoVC.valorItens = calcularTotal()
            editandoVC.projeto = projeto
            editandoVC.custosExtras = projeto!.custosExtras ?? 0
            editandoVC.horasTrabalhadas = projeto!.horasTrabalhadas!
            navigationController?.pushViewController(editandoVC, animated: false)
        }
            
        }
    
    
    @objc func addMaterial(){
        for material in materiaisPreSelecionados {
            var contem = false
            for m in materiaisSelecionados {
                if material.chave == m.chave {
                    m.quantidade = m.quantidade! + material.quantidade!
                    m.atualizarTotal()
                    contem = true
                }
            }
            if contem == false{
                let novoMaterial = Material(nome: material.nome!, tipo: material.tipo!, preco: material.preco!, marca: material.marca!, chave: material.chave!, usuario: material.usuario!)
                novoMaterial.quantidade = material.quantidade
                novoMaterial.atualizarTotal()
                materiaisSelecionados.insert(novoMaterial, at: materiaisSelecionados.count)
                
            }
            
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
                    materiais.insert(material, at: materiais.count)
                }
            }
            
            self.materiais = materiais
            
            self.pesquisar()
            
        }
        
    }
    
    @objc private func fetchDataFrequentes(){
        
        let ref2: DatabaseReference? = Database.database().reference(withPath: "Projeto")
        
        guard let ref = ref2 else {
            print(">>")
            return}
        
        ref.observe(.value) { (DataSnapshot) in
            
            var projetos: [Projeto] = []
            
            for child in DataSnapshot.children {
                
                if let snapshot = child as? DataSnapshot,
                    let projeto = Projeto(snapshot: snapshot){
                    projetos.insert(projeto, at: projetos.count)
                }
            }
            
            var projetosFrequentes: [Projeto] = []
            
            if projetos.count >= 5 {
                
                projetosFrequentes.append(projetos[projetos.count - 5])
                projetosFrequentes.append(projetos[projetos.count - 4])
                projetosFrequentes.append(projetos[projetos.count - 3])
                projetosFrequentes.append(projetos[projetos.count - 2])
                projetosFrequentes.append(projetos[projetos.count - 1])
                
                    } else {
                    
                      for p in projetos {
                         projetosFrequentes.append(p)
                        }
                    
                    }
            
           
            
            var materiaisFrequentes: [Material] = []
            
            for projeto in projetosFrequentes {
                
                for material in projeto.materiais! {
                    
                  let materialAny =  material as! [String:Any]
                    
                    let materialNovo = Material(nome: materialAny["nome"] as! String, tipo: materialAny["tipo"] as! String, preco: materialAny["preco"] as! Float, marca: materialAny["marca"] as! String, usuario: ["nome": "sussa"])
                    
                    if materiaisFrequentes.count == 0 {
                        materiaisFrequentes.append(materialNovo)
                    }
                    else {
                        var existe = false
                        for m in materiaisFrequentes {
                            if m.nome == materialNovo.nome {
                                existe = true
                                break
                            }
                        }
                        if !existe {
                            materiaisFrequentes.append(materialNovo)
                        }
                    }
 
                    
                    
                }
                
            }
            
            self.materiaisPesquisados = materiaisFrequentes
            
            self.ordenarMateriais()
            
            self.materialView.tableView.reloadData()
            
        }
        
    }
    
    func populateCell() {
        
        if let indexPath = self.materialView.tableView.indexPathForSelectedRow {
            let cell = self.materialView.tableView.cellForRow(at: indexPath) as! MaterialTableViewCell
           
                cell.tipo.text = materialView.tipo.text
           
        }
    }
    
    //MARK: TextField
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelectedNow = true
        
        materialView.setCellSpotligth()
        
        if let section = self.materialView.tableView.indexPathForSelectedRow?.section {
            
            // Testing the new coding:
            let indexPathRow = textField.tag
            let indexPath = IndexPath(row: indexPathRow, section: section)
            
            let cell = self.materialView.tableView.cellForRow(at: indexPath) as! MaterialTableViewCell
            
            materialView.nome.text = cell.nome.text
            materialView.preco.text = cell.preco.text
            materialView.tipo.text = cell.tipo.text
            materialView.marca.text = cell.marca.text
            materialView.imgType.image = cell.imgType.image
            materialView.cellMarker.backgroundColor = cell.cellMarker.backgroundColor
            
            materialView.tipo.text = ""
            
            UIView.animate(withDuration: 0.0, animations: {},completion: {(finished: Bool) in
                self.materialView.tipo.becomeFirstResponder()
            })
            
        }
        
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let indexPath = self.materialView.tableView.indexPathForSelectedRow {
            let cell = self.materialView.tableView.cellForRow(at: indexPath) as! MaterialTableViewCell
            cell.tipo.text = "1"
            textField.isSelectedNow = false
    }
    
}
}
extension MaterialViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
       mostrarBotaoAdd()
           let novoMaterial = Material(nome: materiaisPesquisados[indexPath.row].nome!, tipo: materiaisPesquisados[indexPath.row].tipo!, preco: materiaisPesquisados[indexPath.row].preco!, marca: materiaisPesquisados[indexPath.row].marca!, chave: materiaisPesquisados[indexPath.row].chave!, usuario: materiaisPesquisados[indexPath.row].usuario!)
            materiaisPreSelecionados.insert(novoMaterial, at: materiaisPreSelecionados.count)
            materialView.btnAddMaterial.setTitle("\((materiaisPreSelecionados.count)) itens selecionados", for: .normal)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
        return materiaisPesquisados.count
        }else{
            return materiaisSelecionados.count
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if tableView.tag == 1 {
        
        if tableView.indexPathsForSelectedRows == nil {
            esconderBotaoAdd()
        }
        else {
            
            var i = 0
            
            while i < materiaisPreSelecionados.count {
                
                if materiaisPreSelecionados[i].chave == materiaisPesquisados[indexPath.row].chave{
                    materiaisPreSelecionados.remove(at: i)
                    materialView.btnAddMaterial.setTitle("\((materiaisPreSelecionados.count)) itens selecionados", for: .normal)
                    break
                }
                i = i + 1
                
            }
        }
        }
        
        
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath) as! MaterialTableViewCell
        
        
        if tableView.tag == 1 {
            
        let material = materiaisPesquisados[indexPath.row]

        cell.tipo.delegate = self
        
        cell.nome.text = material.nome
        cell.preco.text = "$\(material.preco!)"
        cell.tipo.text = "1"
        cell.marca.text = material.marca
        let tipo = material.tipo?.lowercased()
        cell.imgType.image = UIImage(named: "\(tipo!)IconCor")
            
        // Setting the tag as row indexPath to the quantity textField.
        cell.tipo.tag = indexPath.row
        
        return cell
        }
        else{
            
            let material = materiaisSelecionados[indexPath.row]
            
            cell.dropShadow(shadowRadius: 1,
                            shadowOffsetX: 0,
                            shadowOffsetY: 1)
            
            cell.nome.text = material.nome
            cell.preco.text = "$\(material.total!)"
            cell.tipo.text = "\(material.quantidade!)"
            cell.marca.text = material.marca
            let tipo = material.tipo?.lowercased()
            cell.imgType.image = UIImage(named: "\(tipo!)IconCor")
            
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.tag == 2{
         return UITableViewCell.EditingStyle.delete
        }
        else {
            return UITableViewCell.EditingStyle.none
        }
    }

   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
    forRowAt indexPath: IndexPath) {
        
    if editingStyle == .delete {
        materiaisSelecionados.remove(at: indexPath.row)
        materialView.lblSelectMaterials.text = "\(materiaisSelecionados.count) itens selecionados"
        self.materialView.viewSelectedTableView.reloadData()
    }

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

