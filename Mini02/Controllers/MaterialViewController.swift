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

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let materialView = MaterialView()
        self.view = materialView.setViews()
        materialView.btnFour.addTarget(self, action: #selector(MaterialViewController.goToNewMaterialView), for: .touchDown)
        
        
        self.title = "Adicionar Itens"
        
        
    }
    
    @objc func goToNewMaterialView() {
        let newMaterialsView = NewMaterialViewController()
        navigationController?.pushViewController(newMaterialsView, animated: true)
    }
    
    @objc func test() {
        print("test")
    }
   
}

