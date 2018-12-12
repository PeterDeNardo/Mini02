//
//  MaterialTableViewCell.swift
//  Mini02
//
//  Created by Gabriel Sousa on 10/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {

    var nome: UILabel = UILabel(frame: CGRect(x: 80, y: 8, width: 100, height: 21))
    var preco: UILabel = UILabel(frame: CGRect(x: 289, y: 19, width: 60, height: 21))
    var tipo: UITextField = UITextField(frame: CGRect(x: 202, y: 14, width: 74, height: 32))
    var marca: UILabel = UILabel(frame: CGRect(x: 80, y: 36, width: 100, height: 16))
    var imgType : UIImageView = UIImageView(frame: (CGRect(x: 16, y: 8, width: 45, height: 45)))
    var cellMarker : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 8, height: 64))
    
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
                          ifHaveImageName: "textbox",
                          keyboardType: .numberPad)
    
        marca.setLabelWhithConstraints(fontType: .two, fontSize: 11,
                                       lblText: "Marca/Local",
                                       textColor: .workGrey,
                                       alingnment: .left,
                                       alpha: 1)
        
        imgType.backgroundColor = .clear
        
        self.contentView.addSubview(nome)
        self.contentView.addSubview(preco)
        self.contentView.addSubview(marca)
        self.contentView.addSubview(tipo)
        self.contentView.addSubview(imgType)
        self.contentView.addSubview(cellMarker)
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
            self.contentView.dropShadow(shadowRadius: 1, shadowOffsetX: 0, shadowOffsetY: 1)
            tipo.isUserInteractionEnabled = true
            cellMarker.backgroundColor = .workGreen
            tipo.visibleStatusOfBackgroundImage(image: UIImage(named: "textbox")!, hide: false)
        } else {
            self.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            self.contentView.layer.shadowOpacity = 0.0
            tipo.isUserInteractionEnabled = false
            cellMarker.backgroundColor = .clear
            tipo.visibleStatusOfBackgroundImage(image: UIImage(named: "textbox")!, hide: true)
        }
    }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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


