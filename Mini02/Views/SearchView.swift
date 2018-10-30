import Foundation
import UIKit

class SearchView {
    //MARK: Setting objects in screen
    //Creating Global View
    
    var viewGlobal : UIView!
    
    //Creating Views
    
    let viewFolder = UIView()
    let viewSelected = UIView()
    let viewSelectedBlur = UIView()
    
    //Creating SubViews
    
    //Creating SearchBar SubViews
    
    
    //Creating Folder SubViews
    
    let viewFolderSearchBar = UIView()
    let viewFolderButtons = UIView()
    let viewFolderButtonsFront = UIImageView()
    let viewFolderButtonsBack = UIImageView()
    let viewFolderTableView = UIView()
    let viewFolderTableViewButton = UIView()
    let viewFolderBackGround = UIView()
    
    //Creating SelectedTableView
    
    let viewSelectedCabecalho = UIImageView()
    let viewSelectedCabecalhoButton = UIView()
    let viewSelectedTableView = UITableView()
    
    //Creating Objects inside of views
    
    //viewSearchBar Objects
    
    var schField = UISearchBar()
    
    //viewFolder Objects
    
    var btnSearch : UIButton!
    var btnUserMaterials : UIButton!
    
    var btnSearchAct = UIButton()
    var btnUserMaterialsAct = UIButton()
    
    var buttons = [UIButton]()
    
    var searchBar = UISearchBar()
    
    var btnAddMaterial = UIButton()
    
    var tableView : UITableView!
    
    //viewSearch Objects
    
    let imgBackground = UIImageView()
    let lblSelectMaterials = UILabel()
    let btnEdit = UIButton()
    let btnUndo = UIButton()
    
    func setViews() -> UIView {
        //MARK: Setting Views
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        viewGlobal.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundMaterial")!)
        
        viewGlobal.addSubview(viewFolderSearchBar)
        viewGlobal.addSubview(viewFolder)
        viewFolder.addSubview(viewFolderBackGround)
        viewFolder.addSubview(viewFolderButtons)
        viewFolder.addSubview(viewFolderTableView)
        viewFolder.addSubview(viewFolderTableViewButton)
        
        viewFolder.translatesAutoresizingMaskIntoConstraints = false
        viewFolder.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 75).isActive = true
        viewFolder.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewFolder.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewFolder.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        
        //MARK: SubViews
        //ViewFolder
        
        viewFolder.addSubview(viewFolderButtonsBack)
        viewFolderButtonsBack.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtonsBack.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtonsBack.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtonsBack.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtonsBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewFolderButtonsBack.image = UIImage(named: "SearchButtonBack2")
        
        viewFolder.addSubview(viewFolderButtonsFront)
        viewFolderButtonsFront.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtonsFront.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtonsFront.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtonsFront.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtonsFront.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        viewFolder.addSubview(viewFolderButtons)
        viewFolderButtons.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtons.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtons.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtons.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtons.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewFolderButtons.backgroundColor = .clear
        
        //setObjectsInViewFolderButtons()
        
        viewFolder.addSubview(viewFolderSearchBar)
        viewFolderSearchBar.translatesAutoresizingMaskIntoConstraints = false
        viewFolderSearchBar.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewFolderSearchBar.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderSearchBar.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderSearchBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
        viewFolderSearchBar.backgroundColor = .clear
        
        SetObjectsInViewSearchBar()
        
        viewFolderBackGround.translatesAutoresizingMaskIntoConstraints = false
        viewFolderBackGround.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewFolderBackGround.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderBackGround.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderBackGround.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderBackGround.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundTableView")!)
        
        
        viewFolderTableView.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTableView.topAnchor.constraint(equalTo: viewFolderSearchBar.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderTableView.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderTableView.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.backgroundColor = .clear
        
        setObjectsInViewFoldarTableView()
        setObjectsInViewItem()
        
        //setObjectsInViewFolderTableViewButton()
        
        return viewGlobal
    }
    
    func setObjectsInViewItem() {
        
        var posX : CGFloat = 0
        
        btnSearch = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 3, height: 40))
        
        posX += btnSearch.bounds.width
        
        btnUserMaterials = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 3, height: 40))
        
        viewFolderButtons.addSubview(btnSearch)
        viewFolderButtons.addSubview(btnUserMaterials)
        
        btnSearch.addSubview(btnSearchAct)
        btnSearchAct.translatesAutoresizingMaskIntoConstraints = false
        btnSearchAct.leftAnchor.constraint(equalTo: btnSearch.leftAnchor, constant: 9).isActive = true
        btnSearchAct.rightAnchor.constraint(equalTo: btnSearch.rightAnchor, constant: -2).isActive = true
        btnSearchAct.bottomAnchor.constraint(equalTo: btnSearch.bottomAnchor, constant: 0).isActive = true
        btnSearchAct.topAnchor.constraint(equalTo: btnSearch.topAnchor, constant: 0).isActive = true
        btnSearchAct.setTitle("Materiais", for: .normal)
        btnSearchAct.setTitleColor(.workBlack, for: .normal)
        
        btnUserMaterials.addSubview(btnUserMaterialsAct)
        btnUserMaterialsAct.translatesAutoresizingMaskIntoConstraints = false
        btnUserMaterialsAct.leftAnchor.constraint(equalTo: btnUserMaterials.leftAnchor, constant: 2).isActive = true
        btnUserMaterialsAct.rightAnchor.constraint(equalTo: btnUserMaterials.rightAnchor, constant: -2).isActive = true
        btnUserMaterialsAct.bottomAnchor.constraint(equalTo: btnUserMaterials.bottomAnchor, constant: 0).isActive = true
        btnUserMaterialsAct.topAnchor.constraint(equalTo: btnUserMaterials.topAnchor, constant: 0).isActive = true
        btnUserMaterialsAct.setTitle("Meus", for: .normal)
        btnUserMaterialsAct.setTitleColor(.workBlack, for: .normal)
        
    }
    
    func SetObjectsInViewSearchBar() {
        viewFolderSearchBar.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leftAnchor.constraint(equalTo: viewFolderSearchBar.leftAnchor, constant: 10).isActive = true
        searchBar.rightAnchor.constraint(equalTo: viewFolderSearchBar.rightAnchor, constant: -10).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: viewFolderSearchBar.centerYAnchor, constant: 0).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        searchBar.layer.cornerRadius = 7
        searchBar.clipsToBounds = true
    }
    
    func setObjectsInViewFoldarTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewFolderTableView.addSubview(tableView)
        
    }
    
    
}
