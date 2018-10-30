//
//  SearchViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 12/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = searchView.setViews()
        settingNavigationBar()
        addTargetToButtons()
    }
    
    func settingNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(SearchViewController.addNewMaterial)), animated: true)
        self.title = "Materiais"
   
    }
    
    func addTargetToButtons() {
        searchView.btnSearchAct.addTarget(self, action: #selector(SearchViewController.searchButtonAction), for: .touchDown)
        searchView.btnUserMaterialsAct.addTarget(self, action: #selector(SearchViewController.userMaterialAction), for: .touchDown)
    }
    
    @objc func addNewMaterial() {
    
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
