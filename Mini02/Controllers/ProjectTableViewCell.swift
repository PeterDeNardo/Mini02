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
    var projectPrice: UILabel = UILabel(frame: CGRect(x: 284, y: 50, width: 48, height: 21))
    var projectItens: UILabel = UILabel(frame: CGRect(x: 36, y: 113, width: 75, height: 21))
    var projectHour: UILabel = UILabel(frame: CGRect(x: 284, y: 113, width: 38, height: 21))
    var projectTypeImg: UIImageView = UIImageView(frame: CGRect(x: 25, y: 33, width: 45, height: 45))
    var viewBackground = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(viewBackground)
        backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        viewBackground.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        viewBackground.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        
        projectName.setLabelWhithConstraints(fontType: .two,
                                             fontSize: 18,
                                             lblText: "Nome Projeto",
                                             textColor: .workBlack,
                                             alingnment: .left,
                                             alpha: 1)
        projectDate.setLabelWhithConstraints(fontType: .one,
                                             fontSize: 14,
                                             lblText: "Date",
                                             textColor: .workBlack,
                                             alingnment: .left,
                                             alpha: 0.7)
        projectPrice.setLabelWhithConstraints(fontType: .three,
                                              fontSize: 18,
                                              lblText: "Y$",
                                              textColor: .workBlack,
                                              alingnment: .right,
                                              alpha: 0.7)
        projectItens.setLabelWhithConstraints(fontType: .one,
                                              fontSize: 18,
                                              lblText: "X Itens",
                                              textColor: .workBlack,
                                              alingnment: .left,
                                              alpha: 0.7)
        projectHour.setLabelWhithConstraints(fontType: .one,
                                             fontSize: 18,
                                             lblText: "X h",
                                             textColor: .workBlack,
                                             alingnment: .right,
                                             alpha: 0.7)
        
        projectTypeImg.image = UIImage(named: "costuraIconCor")
        
        addSubview(projectName)
        addSubview(projectDate)
        addSubview(projectPrice)
        addSubview(projectItens)
        addSubview(projectHour)
        addSubview(projectTypeImg)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        
        let image = UIImage(named: "projectBackground")
        let scale : CGFloat = 0.0
        let size = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.bounds.width, height: self.bounds.height), false, scale)
        image?.draw(in: size)
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageView = UIImageView(image: scaledImage)
        self.backgroundView = imageView
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
