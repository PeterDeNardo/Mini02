//
//  NewMaterialViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 12/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class NewMaterialViewController: UIViewController {
    
    let newMaterial = NewMaterialView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = newMaterial.setLayoutInView()
        self.title = "Novo objeto"
        
        newMaterial.btnPapelaria.addTarget(self, action: #selector(NewMaterialViewController.btnPapelaria), for: .touchDown)
        newMaterial.btnSeam.addTarget(self, action: #selector(NewMaterialViewController.btnSeam), for:  .touchDown)
        newMaterial.btnOrganization.addTarget(self, action: #selector(NewMaterialViewController.btnOrganization), for:  .touchDown)
        newMaterial.btnPainting.addTarget(self, action: #selector(NewMaterialViewController.btnPainting), for:  .touchDown)
        newMaterial.btnCraftwork.addTarget(self, action: #selector(NewMaterialViewController.btnCraftwork), for:  .touchDown)
        newMaterial.btnWoodwork.addTarget(self, action: #selector(NewMaterialViewController.btnWoodwork), for:  .touchDown)
        newMaterial.btnDecoration.addTarget(self, action: #selector(NewMaterialViewController.btnDecoration), for:  .touchDown)
        newMaterial.btnOthers.addTarget(self, action: #selector(NewMaterialViewController.btnOthers), for:  .touchDown)

        // Do any additional setup after loading the view.
    }
    
    // MARK: Buttons actions
    
    @objc func btnPapelaria() {
        if newMaterial.btnPapelaria.isSelected == true {
            newMaterial.btnPapelaria.isSelected = false
            newMaterial.btnPapelaria.backgroundColor = .black
        }else {
            newMaterial.btnPapelaria.isSelected = true
            newMaterial.btnPapelaria.backgroundColor = .white
        }
    }
    @objc func btnSeam() {
        if newMaterial.btnSeam.isSelected == true {
            newMaterial.btnSeam.isSelected = false
        }else {
            newMaterial.btnSeam.isSelected = true
        }
    }
    @objc func btnOrganization() {
        if newMaterial.btnOrganization.isSelected == true {
            newMaterial.btnOrganization.isSelected = false
        }else {
            newMaterial.btnOrganization.isSelected = true
        }
    }
    @objc func btnPainting() {
        if newMaterial.btnPainting.isSelected == true {
            newMaterial.btnPainting.isSelected = false
        }else {
            newMaterial.btnPainting.isSelected = true
        }
    }
    @objc func btnCraftwork() {
        if newMaterial.btnCraftwork.isSelected == true {
            newMaterial.btnCraftwork.isSelected = false
        }else {
            newMaterial.btnCraftwork.isSelected = true
        }
    }
    @objc func btnWoodwork() {
        if newMaterial.btnWoodwork.isSelected == true {
            newMaterial.btnWoodwork.isSelected = false
        }else {
            newMaterial.btnWoodwork.isSelected = true
        }
    }
    @objc func btnDecoration() {
        if newMaterial.btnDecoration.isSelected == true {
            newMaterial.btnDecoration.isSelected = false
        }else {
            newMaterial.btnDecoration.isSelected = true
        }
    }
    @objc func btnOthers() {
        if newMaterial.btnOthers.isSelected == true {
            newMaterial.btnOthers.isSelected = false
        }else {
            newMaterial.btnOthers.isSelected = true
        }
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
