import UIKit
import FirebaseDatabase
import Lottie

class NewProjectViewController: UIViewController, UITextFieldDelegate {
    
    let newProjectView = NewProjectView()
    var categoriaEscolhida: String?
    var tap: UITapGestureRecognizer?
    var ref: DatabaseReference?
    var usuario: [String:String]?
    var projeto: Projeto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pegarUserDefaults()
        
        ref = Database.database().reference(withPath: "Projeto")
        self.view = newProjectView.setLayoutInView()
        self.title = "Salvar projeto"
        
        addButtonsTargets()
        addDelegateToTxtFields()
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(salvarProjeto) ), animated: true)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(abaixarTeclado))
        self.view.addGestureRecognizer(tap!)
        
    }
    
    func addDelegateToTxtFields(){
        newProjectView.txtProjectName.delegate = self
        
        newProjectView.txtProjectName.delegate = self
    }
    
    func pegarUserDefaults(){
        
        let defaults = UserDefaults.standard
        
        usuario = [
            "nome" : defaults.string(forKey: "nome"),
            "email" : defaults.string(forKey: "email"),
            "id" : defaults.string(forKey: "id")
            ] as? [String : String]
        
    }
    
    @objc func abaixarTeclado() {
        newProjectView.viewGlobal.endEditing(true)
    }
    
    func addButtonsTargets(){
        newProjectView.btnPapelaria.addTarget(self, action: #selector(NewMaterialViewController.btnPapelaria), for: .touchDown)
        newProjectView.btnSeam.addTarget(self, action: #selector(NewMaterialViewController.btnSeam), for:  .touchDown)
        newProjectView.btnOrganization.addTarget(self, action: #selector(NewMaterialViewController.btnOrganization), for:  .touchDown)
        newProjectView.btnPainting.addTarget(self, action: #selector(NewMaterialViewController.btnPainting), for:  .touchDown)
        newProjectView.btnCraftwork.addTarget(self, action: #selector(NewMaterialViewController.btnCraftwork), for: .touchDown)
        newProjectView.btnWoodwork.addTarget(self, action: #selector(NewMaterialViewController.btnWoodwork), for:  .touchDown)
        newProjectView.btnDecoration.addTarget(self, action: #selector(NewMaterialViewController.btnDecoration), for:  .touchDown)
        newProjectView.btnOthers.addTarget(self, action: #selector(NewMaterialViewController.btnOthers), for:  .touchDown)
        
    }
    
    // MARK: Buttons actions
    
    func desmarcarTodosOsBotoes(){
        categoriaEscolhida = nil
        desmarcarBotao(btn: newProjectView.btnPapelaria)
        desmarcarBotao(btn: newProjectView.btnSeam)
        desmarcarBotao(btn: newProjectView.btnOrganization)
        desmarcarBotao(btn: newProjectView.btnPainting)
        desmarcarBotao(btn: newProjectView.btnCraftwork)
        desmarcarBotao(btn: newProjectView.btnWoodwork)
        desmarcarBotao(btn: newProjectView.btnDecoration)
        desmarcarBotao(btn: newProjectView.btnOthers)
    }
    
    func marcarBotao(btn:UIButton){
        desmarcarTodosOsBotoes()
        btn.isSelected = true
        btn.backgroundColor = .white
        btn.setTitleColor(.black , for: .normal)
        categoriaEscolhida = btn.titleLabel?.text!
    }
    
    func desmarcarBotao(btn: UIButton){
        btn.isSelected = false
        btn.backgroundColor = .black
        btn.setTitleColor(.white , for: .normal)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text?.removeAll()
    }
    
   
   
    
    @objc func btnPapelaria() {
        
        if newProjectView.btnPapelaria.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnPapelaria)
        }else {
            marcarBotao(btn: newProjectView.btnPapelaria)
        }
    }
    
    @objc func btnSeam() {
        if newProjectView.btnSeam.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnSeam)
        }else {
            marcarBotao(btn: newProjectView.btnSeam)
        }
    }
    
    @objc func btnOrganization() {
        if newProjectView.btnOrganization.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnOrganization)
        }else {
            marcarBotao(btn: newProjectView.btnOrganization)
        }
    }
    
    @objc func btnPainting() {
        if newProjectView.btnPainting.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnPainting)
        }else {
            marcarBotao(btn: newProjectView.btnPainting)
        }
    }
    
    @objc func btnCraftwork() {
        if newProjectView.btnCraftwork.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnCraftwork)
        }else {
            marcarBotao(btn: newProjectView.btnCraftwork)
        }
    }
    
    @objc func btnWoodwork() {
        if newProjectView.btnWoodwork.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnWoodwork)
        }else {
            marcarBotao(btn: newProjectView.btnWoodwork)
        }
    }
    
    @objc func btnDecoration() {
        if newProjectView.btnDecoration.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnDecoration)
        }else {
            marcarBotao(btn: newProjectView.btnDecoration)
        }
    }
    
    @objc func btnOthers() {
        
        if newProjectView.btnOthers.isSelected == true {
            desmarcarBotao(btn: newProjectView.btnOthers)
        }else {
            marcarBotao(btn: newProjectView.btnOthers)
        }
    }
    
    func blur(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    @objc func salvarProjeto(){
        
        guard let nomeProjeto = newProjectView.txtProjectName.text else {return}
        guard let categoria = categoriaEscolhida else {return}
        
        projeto?.setNome(nome: nomeProjeto)
        projeto?.setCategoria(categoria: categoria)
        
        guard let ref = self.ref else{return}
        
        let projetoRef = ref.childByAutoId()
        
        projetoRef.setValue(projeto?.toAnyObject())
        
        let projectsViewController = ProjectsViewController()
        
        //animacao
        let animationView = LOTAnimationView(name: "done")
        animationView.animationSpeed = CGFloat(1.3)
        blur()
        self.view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        animationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        animationView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        animationView.play{ (finished) in
            self.navigationController?.pushViewController(projectsViewController, animated: true)
        }
        
        
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
