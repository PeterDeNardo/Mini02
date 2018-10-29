//
//  MaterialTableViewCell.swift
//  Mini02
//
//  Created by Gabriel Sousa on 10/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {

    var nome: UILabel = UILabel(frame: CGRect(x: 76, y: 8, width: 80, height: 21))
    var preco: UILabel = UILabel(frame: CGRect(x: 289, y: 19, width: 60, height: 21))
    var tipo: UITextField = UITextField(frame: CGRect(x: 202, y: 14, width: 74, height: 32))
    var marca: UILabel = UILabel(frame: CGRect(x: 76, y: 36, width: 100, height: 16))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nome.setLabelWhithConstraints(fontType: .two,
                                      fontSize: 14,
                                      lblText: "Material",
                                      textColor: .workGrey,
                                      alingnment: .left,
                                      alpha: 1)
        
        preco.setLabelWhithConstraints(fontType: .three,
                                       fontSize: 18,
                                       lblText: "R$000.0",
                                       textColor: .workGrey,
                                       alingnment: .right,
                                       alpha: 1)
        
        tipo.setTextField(fontType: .one,
                          fontSize: 18,
                          lblText: "1 un",
                          textColor: .workGrey,
                          alingnment: .rigth,
                          alpha: 0.7,
                          ifHaveImageName: "textbox")
    
        
        marca.setLabelWhithConstraints(fontType: .two, fontSize: 11,
                                       lblText: "Marca/Local",
                                       textColor: .workGrey,
                                       alingnment: .left,
                                       alpha: 1)
        
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
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true {
            self.contentView.backgroundColor = UIColor.white
            self.tipo.isUserInteractionEnabled = false
            self.tipo.visibleStatusOfBackgroundImage(image: UIImage(named: "textbox")!, hide: false)
        } else {
            self.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
            self.tipo.isUserInteractionEnabled = true
            self.tipo.visibleStatusOfBackgroundImage(image: UIImage(named: "textbox")!, hide: true)
        }
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
//        nome.frame = CGRect(x: 76, y: 8, width: 75, height: 21)
//        preco.frame = CGRect(x: 308, y: 25, width: 24, height: 21)
//        tipo.frame = CGRect(x: 225, y: 19, width: 39, height: 21)
//        marca.frame = CGRect(x: 76, y: 36, width: 77, height: 16)

        
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


