import Foundation

extension ControllerNewAddIngredient
{
    private func ingredientCreated(
        ingredient:Ingredient?,
        error:Error?)
    {
        guard
        
            let error:Error = error
        
        else
        {
            if let ingredient:Ingredient = ingredient
            {
                self.selectIngredient(ingredient:ingredient)
            }
            
            return
        }
        
        self.ingredientCreateError(error:error)
    }
    
    private func ingredientCreateError(error:Error)
    {
        self.viewMain.viewSpinner.stopAnimating()
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = true
        self.viewMain.viewList.isHidden = false
        
        ViewAlert.messageFail(message:error.localizedDescription)
    }
    
    //MARK: internal
    
    func createIngredient()
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = false
        self.viewMain.viewList.isHidden = true
        self.viewMain.viewSpinner.startAnimating()
        
        self.model.createIngredient
        { [weak self] (ingredient:Ingredient?, error:Error?) in
            
            self?.ingredientCreated(
                ingredient:ingredient,
                error:error)
        }
    }
}
