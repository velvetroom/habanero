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
        
        self.model.load
        { [weak self] in
         
            self?.ingredientsLoaded()
        }
    }
    
    //MARK: private
    
    private func ingredientsLoaded()
    {
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = true
        self.viewMain.viewBar.searchBar.becomeFirstResponder()
    }
    
    //MARK: internal
    
    func transitionBack()
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        self.parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
}
