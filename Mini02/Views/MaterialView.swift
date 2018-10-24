
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
    let viewFolderButtonsFront = UIImageView()
    let viewFolderButtonsBack = UIImageView()
    let viewFolderTableView = UIView()
    let viewFolderTabkeViewButton = UIView()
    let viewFolderBackGround = UIView()
    
    //Creating Objects inside of views
    
    //viewSearchBar Objects
    
    var schField = UISearchBar()
    
    //viewFolder Objects
    
    var btnSearch : UIButton!
    var btnTwo : UIButton!
    var btnThree : UIButton!
    var btnFour : UIButton!
    
    var btnVisualOne = UIButton()
    var btnVisualTwo = UIButton()
    var btnVisualThree = UIButton()
    
    var buttons = [UIButton]()
    
    var searchBar = UISearchBar()
    
    var btnAddMaterial = UIButton()
    
    var tableView : UITableView!
    
    func setViews() -> UIView {
        //MARK: Setting Views
        viewGlobal = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        viewGlobal.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundMaterial")!)
        
        viewGlobal.addSubview(viewSearchBar)
        viewGlobal.addSubview(viewFolder)
        viewFolder.addSubview(viewFolderBackGround)
        viewFolder.addSubview(viewFolderButtons)
        viewFolder.addSubview(viewFolderTableView)
        viewFolder.addSubview(viewFolderTabkeViewButton)
        
        viewFolder.translatesAutoresizingMaskIntoConstraints = false
        viewFolder.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 85).isActive = true
        viewFolder.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewFolder.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewFolder.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        
        //MARK: SubViews
        //ViewFolder
        
        viewFolder.addSubview(viewFolderButtonsFront)
        viewFolderButtonsFront.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtonsFront.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtonsFront.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtonsFront.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtonsFront.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        viewFolder.addSubview(viewFolderButtonsBack)
        viewFolderButtonsBack.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtonsBack.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtonsBack.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtonsBack.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtonsBack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewFolderButtonsBack.image = UIImage(named: "SearchButtonBack")

        viewFolder.addSubview(viewFolderButtons)
        viewFolderButtons.translatesAutoresizingMaskIntoConstraints = false
        viewFolderButtons.topAnchor.constraint(equalTo: viewFolder.topAnchor, constant: 0).isActive = true
        viewFolderButtons.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderButtons.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderButtons.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewFolderButtons.backgroundColor = .clear
        
        //setObjectsInViewFolderButtons()
        
        viewFolder.addSubview(viewSearchBar)
        viewSearchBar.translatesAutoresizingMaskIntoConstraints = false
        viewSearchBar.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewSearchBar.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewSearchBar.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewSearchBar.heightAnchor.constraint(equalToConstant: 55).isActive = true
        viewSearchBar.backgroundColor = .clear
        
        SetObjectsInViewSearchBar()
        
        viewFolderBackGround.translatesAutoresizingMaskIntoConstraints = false
        viewFolderBackGround.topAnchor.constraint(equalTo: viewFolderButtons.bottomAnchor, constant: 0).isActive = true
        viewFolderBackGround.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderBackGround.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderBackGround.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderBackGround.backgroundColor = UIColor.init(patternImage: UIImage(named: "backGroundTableView")!)
        
 
        viewFolderTableView.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTableView.topAnchor.constraint(equalTo: viewSearchBar.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.leftAnchor.constraint(equalTo: viewFolder.leftAnchor, constant: 0).isActive = true
        viewFolderTableView.rightAnchor.constraint(equalTo: viewFolder.rightAnchor, constant: 0).isActive = true
        viewFolderTableView.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTableView.backgroundColor = .clear
        
        setObjectsInViewFoldarTableView()
        
        viewFolderTabkeViewButton.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTabkeViewButton.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTabkeViewButton.widthAnchor.constraint(equalToConstant: 218).isActive = true
        viewFolderTabkeViewButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        viewFolderTabkeViewButton.centerXAnchor.constraint(equalTo: viewFolder.centerXAnchor).isActive = true
        
        setObjectsInViewFolderTableViewButton()
        setObjectsInViewItem()
   
        return viewGlobal
    }

    func setObjectsInViewItem() {
        
        var posX : CGFloat = 0
        
        btnTwo = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 3, height: 40))
        
        posX += btnTwo.bounds.width
        
        btnThree = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 3, height: 40))
        
        posX += btnThree.bounds.width
        
        btnFour = UIButton(frame: CGRect(x: posX, y: 0, width: UIScreen.main.bounds.width / 3, height: 40))
        
        
        viewFolderButtons.addSubview(btnTwo)
        viewFolderButtons.addSubview(btnThree)
        viewFolderButtons.addSubview(btnFour)

        btnTwo.addSubview(btnVisualOne)
        btnVisualOne.translatesAutoresizingMaskIntoConstraints = false
        btnVisualOne.leftAnchor.constraint(equalTo: btnTwo.leftAnchor, constant: 9).isActive = true
        btnVisualOne.rightAnchor.constraint(equalTo: btnTwo.rightAnchor, constant: -2).isActive = true
        btnVisualOne.bottomAnchor.constraint(equalTo: btnTwo.bottomAnchor, constant: 0).isActive = true
        btnVisualOne.topAnchor.constraint(equalTo: btnTwo.topAnchor, constant: 0).isActive = true
        btnVisualOne.setTitle("Materiais", for: .normal)
        btnVisualOne.setTitleColor(.workBlack, for: .normal)
        
        btnThree.addSubview(btnVisualTwo)
        btnVisualTwo.translatesAutoresizingMaskIntoConstraints = false
        btnVisualTwo.leftAnchor.constraint(equalTo: btnThree.leftAnchor, constant: 2).isActive = true
        btnVisualTwo.rightAnchor.constraint(equalTo: btnThree.rightAnchor, constant: -2).isActive = true
        btnVisualTwo.bottomAnchor.constraint(equalTo: btnThree.bottomAnchor, constant: 0).isActive = true
        btnVisualTwo.topAnchor.constraint(equalTo: btnThree.topAnchor, constant: 0).isActive = true
        btnVisualTwo.setTitle("Meus", for: .normal)
        btnVisualTwo.setTitleColor(.workBlack, for: .normal)
        
        btnFour.addSubview(btnVisualThree)
        btnVisualThree.translatesAutoresizingMaskIntoConstraints = false
        btnVisualThree.leftAnchor.constraint(equalTo: btnFour.leftAnchor, constant: 2).isActive = true
        btnVisualThree.rightAnchor.constraint(equalTo: btnFour.rightAnchor, constant: -9).isActive = true
        btnVisualThree.bottomAnchor.constraint(equalTo: btnFour.bottomAnchor, constant: 0).isActive = true
        btnVisualThree.topAnchor.constraint(equalTo: btnFour.topAnchor, constant: 0).isActive = true
        btnVisualThree.setTitle("Frequent", for: .normal)
        btnVisualThree.setTitleColor(.workBlack, for: .normal)
        
        
        
    }
    
    func SetObjectsInViewSearchBar() {
        viewSearchBar.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leftAnchor.constraint(equalTo: viewSearchBar.leftAnchor, constant: 10).isActive = true
        searchBar.rightAnchor.constraint(equalTo: viewSearchBar.rightAnchor, constant: 10).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: viewSearchBar.centerYAnchor, constant: 0).isActive = true
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


