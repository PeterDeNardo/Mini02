
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
    
    //Creating SearchBar SubViews
    
    
    //Creating Folder SubViews
    
    let viewFolderButtons = UIView()
    let viewFolderTableView = UIView()
    let viewFolderTabkeViewButton = UIView()
    
    //Creating Objects inside of views
    
    //viewSearchBar Objects
    
    var schField = UISearchBar()
    
    //viewFolder Objects
    
    var btnSearch : UIButton!
    var btnTwo : UIButton!
    var btnThree : UIButton!
    var btnFour : UIButton!
    
    var buttons = [UIButton]()
    
    var btnAddMaterial = UIButton()
    
    var tableView : UITableView!
    
    func setViews() -> UIView {
        //MARK: Setting Views
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        viewGlobal.backgroundColor = .clear
        
        viewGlobal.addSubview(viewSearchBar)
        viewGlobal.addSubview(viewFolder)
        viewFolder.addSubview(viewFolderButtons)
        viewFolder.addSubview(viewFolderTableView)
        viewFolder.addSubview(viewFolderTabkeViewButton)
        
        viewFolder.translatesAutoresizingMaskIntoConstraints = false
        viewFolder.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 70).isActive = true
        viewFolder.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewFolder.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewFolder.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        viewFolder.backgroundColor = .clear
        
        //MARK: SubViews
        //ViewFolder

        viewFolder.addSubview(viewFolderButtons)
        viewFolderButtons.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtons.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtons.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtons.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtons.heightAnchor.constraint(equalToConstant: 60).isActive = true
        viewFolderButtons.backgroundColor = .black
        
        //setObjectsInViewFolderButtons()
        
        viewFolder.addSubview(viewSearchBar)
        viewSearchBar.translatesAutoresizingMaskIntoConstraints = false
        viewSearchBar.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewSearchBar.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewSearchBar.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewSearchBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
        viewSearchBar.backgroundColor = .green
        
        //SetObjectsInViewSearchBar()
        
 
        viewFolderTableView.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTableView.topAnchor.constraint(equalTo: viewSearchBar.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderTableView.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderTableView.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundTableView")!)
        
        setObjectsInViewFoldarTableView()
        
        viewFolderTabkeViewButton.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTabkeViewButton.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTabkeViewButton.widthAnchor.constraint(equalToConstant: 218).isActive = true
        viewFolderTabkeViewButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        viewFolderTabkeViewButton.centerXAnchor.constraint(equalTo: viewFolder.centerXAnchor).isActive = true
        
        setObjectsInViewFolderTableViewButton()
   
        return viewGlobal
    }

    func setObjectsInViewItem() {
        
        var posX : CGFloat = 0
        
        btnSearch = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 4, height: 70))
        btnSearch.setButton(titleText: "Selected",
                            backgroundColor:    UIColor.init(patternImage: UIImage(named: "backGroundButtonBlueTableView")!))
        
        posX += btnSearch.bounds.width
        
        btnTwo = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 4, height: 70))
        btnTwo.setButton(titleText: "Frequent",
                         backgroundColor: UIColor.init(patternImage: UIImage(named: "backGroundButtonTableView")!))
        
        posX += btnTwo.bounds.width
        
        btnThree = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 4, height: 70))
        btnThree.setButton(titleText: "Mine",
                           backgroundColor: UIColor.init(patternImage: UIImage(named: "backGroundButtonTableView")!))
        
        posX += btnThree.bounds.width
        
        btnFour = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 4, height: 70))
        btnFour.setButton(titleText: "Search",
                          backgroundColor: UIColor.init(patternImage: UIImage(named: "backGroundButtonTableView")!))
        
        viewFolderButtons.addSubview(btnSearch)
        viewFolderButtons.addSubview(btnTwo)
        viewFolderButtons.addSubview(btnThree)
        viewFolderButtons.addSubview(btnFour)

        
        
        
    }
    
    func setObjectsInViewFoldarTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewFolderTableView.addSubview(tableView)
        
    }
    
    func setObjectsInViewFolderTableViewButton() {
        btnAddMaterial = UIButton(frame: CGRect(x: 0, y: 0, width: 218, height: 52))
        btnAddMaterial.setButton(titleText: "1 item selecionado",
                                 backgroundColor: .green)
        viewFolderTabkeViewButton.addSubview(btnAddMaterial)
    }
    
    
    
    
    
}


