import Foundation

final class ControllerNewAddIngredient:Controller<ArchNewAddIngredient>
{
    init(
        build:Build,
        database:Database)
    {
        super.init()
        
        self.model.build = build
        self.model.database = database
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = false
        self.viewMain.viewList.isHidden = true
        
        self.model.load
        { [weak self] (error:Error?) in
         
            self?.ingredientsLoaded(error:error)
        }
    }
    
    //MARK: private
    
    private func ingredientsLoaded(error:Error?)
    {
        guard
        
            let error:Error = error
        
        else
        {
            self.updateIngredients()
            
            return
        }
        
        ViewAlert.messageFail(message:error.localizedDescription)
    }
    
    private func updateIngredients()
    {
        self.viewMain.viewSpinner.stopAnimating()
        self.viewMain.viewList.isHidden = false
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = true
        self.viewMain.viewBar.searchBar.becomeFirstResponder()
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func searchIngredient(searching:String)
    {
        self.model.searchIngredient(searching:searching)
        { [weak self] in
            
            self?.viewMain.viewList.collectionView.reloadData()
        }
    }
    
    func createIngredient()
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = false
        self.viewMain.viewList.isHidden = true
        self.viewMain.viewSpinner.startAnimating()
        
        self.model.createIngredient
        { [weak self] (ingredient:Ingredient?, error:Error?) in
            
        }
    }
}
