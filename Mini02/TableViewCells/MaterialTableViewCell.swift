//
//  MaterialTableViewCell.swift
//  Mini02
//
//  Created by Gabriel Sousa on 10/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {

    var nome: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    var preco: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    var tipo: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    var marca: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nome.backgroundColor = UIColor.yellow
        
        self.contentView.addSubview(nome)
         self.contentView.addSubview(preco)
         self.contentView.addSubview(marca)
         self.contentView.addSubview(tipo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nome.frame = CGRect(x: 20, y: 0, width: 70, height: 30)
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
        nome.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        preco.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        tipo.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        marca.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        
        contentView.addSubview(nome)
        contentView.addSubview(preco)
        contentView.addSubview(tipo)
        contentView.addSubview(marca)
        
        let viewsDict = [
            "Nome" : nome,
            "Preço" : preco,
            "Tipo" : tipo,
            "Marca" : marca
            ]

    }
    
}


