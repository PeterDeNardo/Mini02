
import Foundation
import UIKit

class MaterialView {
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
    var viewSelectedTableView = UITableView()
    
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
        viewGlobal.addSubview(viewSelectedBlur)
        viewGlobal.addSubview(viewSelected)
        viewFolder.addSubview(viewFolderBackGround)
        viewFolder.addSubview(viewFolderButtons)
        viewFolder.addSubview(viewFolderTableView)
        viewFolder.addSubview(viewFolderTableViewButton)
        
        viewFolder.translatesAutoresizingMaskIntoConstraints = false
        viewFolder.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 75).isActive = true
        viewFolder.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewFolder.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewFolder.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        
        viewSelected.translatesAutoresizingMaskIntoConstraints = false
        viewSelected.topAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: -64).isActive = true
        viewSelected.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewSelected.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewSelected.heightAnchor.constraint(equalToConstant: 487).isActive = true
        viewSelected.backgroundColor  = .clear
        
        viewSelectedBlur.translatesAutoresizingMaskIntoConstraints = false
        viewSelectedBlur.topAnchor.constraint(equalTo: viewGlobal.topAnchor, constant: 0).isActive = true
        viewSelectedBlur.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewSelectedBlur.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewSelectedBlur.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 0).isActive = true
        viewSelectedBlur.isUserInteractionEnabled = false
        viewSelectedBlur.backgroundColor = .clear
        
        
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
        
        viewFolderTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        viewFolderTableViewButton.bottomAnchor.constraint(equalTo: viewFolder.bottomAnchor, constant: 0).isActive = true
        viewFolderTableViewButton.widthAnchor.constraint(equalToConstant: 218).isActive = true
        viewFolderTableViewButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        viewFolderTableViewButton.centerXAnchor.constraint(equalTo: viewFolder.centerXAnchor).isActive = true
        
        setObjectsInViewItem()
        
        //viewSelectedTableView
        
        viewSelected.addSubview(viewSelectedTableView)
        viewSelectedTableView.translatesAutoresizingMaskIntoConstraints = false
        viewSelectedTableView.topAnchor.constraint(equalTo: viewSelected.topAnchor, constant: 56).isActive = true
        viewSelectedTableView.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewSelectedTableView.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewSelectedTableView.heightAnchor.constraint(equalToConstant: 450).isActive = true

        
        viewSelected.addSubview(viewSelectedCabecalho)
        viewSelectedCabecalho.translatesAutoresizingMaskIntoConstraints = false
        viewSelectedCabecalho.topAnchor.constraint(equalTo: viewSelected.topAnchor, constant: 0).isActive = true
        viewSelectedCabecalho.leftAnchor.constraint(equalTo: viewGlobal.leftAnchor, constant: 0).isActive = true
        viewSelectedCabecalho.rightAnchor.constraint(equalTo: viewGlobal.rightAnchor, constant: 0).isActive = true
        viewSelectedCabecalho.heightAnchor.constraint(equalToConstant: 64).isActive = true
        viewSelectedCabecalho.image = UIImage(named: "modalOpenBackground")
        
        viewSelected.addSubview(viewSelectedCabecalhoButton)
        viewSelectedCabecalhoButton.translatesAutoresizingMaskIntoConstraints = false
        viewSelectedCabecalhoButton.widthAnchor.constraint(equalToConstant: 257).isActive = true
        viewSelectedCabecalhoButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        viewSelectedCabecalhoButton.centerXAnchor.constraint(equalTo: viewGlobal.centerXAnchor).isActive = true
        viewSelectedCabecalhoButton.bottomAnchor.constraint(equalTo: viewGlobal.bottomAnchor, constant: 5).isActive = true
   
        setObjectsInViewFolderTableViewButton()
        setObjectsInViewSelected()
        
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
        viewFolderSearchBar.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leftAnchor.constraint(equalTo: viewFolderSearchBar.leftAnchor, constant: 10).isActive = true
        searchBar.rightAnchor.constraint(equalTo: viewFolderSearchBar.rightAnchor, constant: -10).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: viewFolderSearchBar.centerYAnchor, constant: 0).isActive = true
        searchBar.layer.cornerRadius = 7
        searchBar.clipsToBounds = true
        searchBar.text = "Procurar nos selecionados"
    }
    
    func setObjectsInViewSelected() {
//        viewSelectedTableView.addSubview(imgBackground)
//        imgBackground.topAnchor.constraint(equalTo: viewSelectedTableView.topAnchor, constant: 0).isActive = true
//        imgBackground.leftAnchor.constraint(equalTo: viewSelectedTableView.leftAnchor, constant: 0).isActive = true
//        imgBackground.rightAnchor.constraint(equalTo: viewSelectedTableView.rightAnchor, constant: 0).isActive = true
//        imgBackground.bottomAnchor.constraint(equalTo: viewSelectedTableView.bottomAnchor, constant: 0).isActive = true
//        imgBackground.image = UIImage(named: "modalOpenBackgroundBranco")
        
        viewSelectedCabecalho.addSubview(lblSelectMaterials)
        lblSelectMaterials.translatesAutoresizingMaskIntoConstraints = false
        lblSelectMaterials.centerXAnchor.constraint(equalTo: viewSelectedCabecalhoButton.centerXAnchor).isActive = true
        lblSelectMaterials.topAnchor.constraint(equalTo: viewSelectedCabecalho.topAnchor, constant: 24).isActive = true
        lblSelectMaterials.heightAnchor.constraint(equalToConstant: 21).isActive = true
        lblSelectMaterials.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        lblSelectMaterials.setLabelWhithConstraints(fontType: .three,
                                                    fontSize: 18,
                                                    lblText: "Itens selecionados",
                                                    textColor: .white,
                                                    alingnment: .center,
                                                    alpha: 1)
    }
    
    func setObjectsInViewFoldarTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewFolderTableView.addSubview(tableView)
        
    }
    
    func setObjectsInViewFolderTableViewButton() {
        btnAddMaterial = UIButton(frame: CGRect(x: 0, y: 0, width: 257, height: 45))
        btnAddMaterial.setButton(titleText: "Confirmar selecionado",
                                 backgroundColor: .workGreen)
        btnAddMaterial.dropShadow()
        btnAddMaterial.layer.cornerRadius = 7
        viewSelectedCabecalhoButton.addSubview(btnAddMaterial)
        
        viewSelectedCabecalhoButton.addSubview(btnEdit)
        btnEdit.translatesAutoresizingMaskIntoConstraints = false
        btnEdit.leftAnchor.constraint(equalTo: viewSelectedCabecalho.leftAnchor, constant: 16).isActive = true
        btnEdit.topAnchor.constraint(equalTo: viewSelectedCabecalho.topAnchor, constant: 24).isActive = true
        btnEdit.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btnEdit.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btnEdit.setButton(titleText: "Edit",
                          backgroundColor: .clear)
        
        viewSelectedCabecalhoButton.addSubview(btnUndo)
        btnUndo.translatesAutoresizingMaskIntoConstraints = false
        btnUndo.rightAnchor.constraint(equalTo: viewSelectedCabecalho.rightAnchor, constant: -17).isActive = true
        btnUndo.topAnchor.constraint(equalTo: viewSelectedCabecalho.topAnchor, constant: 24).isActive = true
        btnUndo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btnUndo.widthAnchor.constraint(equalToConstant: 45).isActive = true
        btnUndo.setButton(titleText: "Undo",
                          backgroundColor: .clear)
    }
    

    
    
    
}


