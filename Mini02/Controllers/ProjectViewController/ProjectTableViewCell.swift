//
//  ProjectTableViewCell.swift
//  Mini02
//
//  Created by Peter De Nardo on 17/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    var projectName: UILabel = UILabel(frame: CGRect(x: 92, y: 33, width: 123, height: 21))
    var projectDate: UILabel = UILabel(frame: CGRect(x: 92, y: 63, width: 123, height: 16))
    var projectPrice: UILabel = UILabel(frame: CGRect(x: 387, y: 21, width: 48, height: 21))
    var projectItens: UILabel = UILabel(frame: CGRect(x: 36, y: 113, width: 75, height: 21))
    var projectHour: UILabel = UILabel(frame: CGRect(x: 284, y: 113, width: 38, height: 21))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        projectName.setLabelWhithConstraints(fontSize: 18,
                                             lblText: "Nome Projeto",
                                             textColor: .workBlack,
                                             alingnment: .left,
                                             alpha: 1)
        projectDate.setLabelWhithConstraints(fontSize: 14,
                                             lblText: "Date",
                                             textColor: .workBlack,
                                             alingnment: .left,
                                             alpha: 0.7)
        projectPrice.setLabelWhithConstraints(fontSize: 18,
                                              lblText: "Y$",
                                              textColor: .workBlack,
                                              alingnment: .right,
                                              alpha: 0.7)
        projectItens.setLabelWhithConstraints(fontSize: 18,
                                              lblText: "X Itens",
                                              textColor: .workBlack,
                                              alingnment: .left,
                                              alpha: 0.7)
        projectHour.setLabelWhithConstraints(fontSize: 18,
                                             lblText: "X h",
                                             textColor: .workBlack,
                                             alingnment: .right,
                                             alpha: 0.7)
        
        addSubview(projectName)
        addSubview(projectDate)
        addSubview(projectPrice)
        addSubview(projectItens)
        addSubview(projectHour)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
