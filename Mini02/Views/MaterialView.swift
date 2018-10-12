
import Foundation
import UIKit

class MaterialView {
    //MARK: Setting objects in screen
    //Creating Global View
    
    var viewGlobal : UIView!
    
    //Creating Views
    
    let viewSearchBar = UIView()
    let viewFolder = UIView()
    
    
    //Creating SubViews
    //Creating Folder SubViews
    
    let viewFolderButtons = UIView()
    let viewFolderTableView = UIView()
    
    //Creating Objects inside of views

    let tableView = UITableView()
    
    func setLayoutInView(view: UIView) {
        setViews(view: view)
    }
    
    func setViews(view : UIView) {
        viewGlobal = UIView(frame: (CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)))
        viewGlobal.backgroundColor = .yellow
        view.addSubview(viewGlobal)
        
        viewGlobal.addSubview(viewFolder)
        viewFolder.translatesAutoresizingMaskIntoConstraints = false
        viewFolder.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 0).isActive = true
        viewFolder.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewFolder.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewFolder.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        
        
        //SubViews
        //ViewFolder
        
        viewFolder.addSubview(viewFolderButtons)
        viewFolderButtons.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtons.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtons.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtons.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtons.heightAnchor.constraint(equalToConstant: 60).isActive = true
        viewFolderButtons.backgroundColor = .black
        
        setObjectsInViewFolderButtons(view: viewFolderButtons)
        
        viewFolder.addSubview(viewFolderTableView)
        viewFolderTableView.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTableView.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderTableView.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderTableView.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.backgroundColor = .red
        
        setObjectsInViewFoldarTableView(view: viewFolderTableView)
   
        
        
    }
    
    func setObjectsInViewFolderButtons(view : UIView) {
        
    }
    
    func setObjectsInViewFoldarTableView(view : UIView) {
        viewFolderTableView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: viewFolderTableView.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: viewFolderTableView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: viewFolderTableView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: viewFolderTableView.bottomAnchor, constant: 0).isActive = true
    }
    
    
    
    
    
}


