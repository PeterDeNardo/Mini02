import Foundation
import UIKit

class SearchView {
    //MARK: Setting objects in screen
    //Creating Global View
    
    var viewGlobal : UIView!
    
    //Creating Views
    
    let viewSearchBar = UIView()
    let viewFolder = UIView()
    
    
    //Creating SubViews
    
    //Creating SearchBar SubViews
    
    
    //Creating Folder SubViews
    
    let viewFolderButtons = UIView()
    let viewFolderTableView = UIView()
    
    //Creating Objects inside of views
    
    //viewSearchBar Objects
    
    var schField = UISearchBar()
    
    //viewFolder Objects
    
    var btnSearch : UIButton!
    var btnRecent : UIButton!

    
    var buttons = [UIButton]()
    
    var tableView : UITableView!
    
    
    func setViews() -> UIView {
        //MARK: Setting Views
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        viewGlobal.backgroundColor = .yellow
        
        viewGlobal.addSubview(viewSearchBar)
        viewGlobal.addSubview(viewFolder)
        viewFolder.addSubview(viewFolderButtons)
        viewFolder.addSubview(viewFolderTableView)
        
        
        viewSearchBar.translatesAutoresizingMaskIntoConstraints = false
        viewSearchBar.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 70).isActive = true
        viewSearchBar.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewSearchBar.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewSearchBar.heightAnchor.constraint(equalToConstant: 70).isActive = true
        viewSearchBar.backgroundColor = .green
        
        
        viewFolder.translatesAutoresizingMaskIntoConstraints = false
        viewFolder.topAnchor.constraint(equalTo: viewSearchBar.bottomAnchor, constant: 0).isActive = true
        viewFolder.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewFolder.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewFolder.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        viewFolder.backgroundColor = .blue
        
        //MARK: SubViews
        //viewSearch
        
        
        
        //ViewFolder
        
        
        viewFolderButtons.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtons.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtons.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtons.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtons.heightAnchor.constraint(equalToConstant: 60).isActive = true
        viewFolderButtons.backgroundColor = .black
        
        setObjectsInViewFolderButtons()
        
        
        viewFolderTableView.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTableView.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderTableView.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderTableView.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.backgroundColor = .red
        
        setObjectsInViewFoldarTableView()
        
        return viewGlobal
    }
    
    func setObjectsInViewSearchBar() {
        
    }
    
    func setObjectsInViewFolderButtons() {
        
        var posX : CGFloat = 0
        
        btnSearch = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 4, height: 70))
        btnSearch.setButton(titleText: "Selected",
                            backgroundColor: .black)
        
        posX += btnSearch.bounds.width
        
        btnRecent = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 4, height: 70))
        btnRecent.setButton(titleText: "Frequent",
                         backgroundColor: .black)
        
        viewFolderButtons.addSubview(btnSearch)
        viewFolderButtons.addSubview(btnRecent)
    
    }
    
    func setObjectsInViewFoldarTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewFolderTableView.addSubview(tableView)
    } 
    
}


