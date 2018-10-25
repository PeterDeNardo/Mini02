import Foundation
import UIKit

class ProjectsView {
    // Seting Global View
    
    var viewGlobal : UIView!
    
    // setting Views
    
    var viewNavigationSafeArea = UIView()
    var viewTableViewProjects = UITableView()
    
    
    
    func setViewsInLayout() -> UIView{
        viewGlobal = UIView(frame: (CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        viewGlobal.backgroundColor = .clear
        
        viewGlobal.addSubview(viewNavigationSafeArea)
        viewNavigationSafeArea.translatesAutoresizingMaskIntoConstraints = false
        viewNavigationSafeArea.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewNavigationSafeArea.heightAnchor.constraint(equalToConstant: 68).isActive = true
        viewNavigationSafeArea.backgroundColor = .white
        
        viewGlobal.addSubview(viewTableViewProjects)
        viewTableViewProjects.translatesAutoresizingMaskIntoConstraints = false
        viewTableViewProjects.topAnchor.constraint(equalTo: viewNavigationSafeArea.bottomAnchor, constant: 0).isActive = true
        viewTableViewProjects.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewTableViewProjects.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewTableViewProjects.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        viewTableViewProjects.backgroundColor = .white
        
        return viewGlobal
    }
}
