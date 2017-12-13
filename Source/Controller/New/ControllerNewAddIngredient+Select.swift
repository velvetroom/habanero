import Foundation

extension ControllerNewAddIngredient
{
    //MARK: private
    
    private func ingredientSelected(error:Error?)
    {
        guard
        
            let error:Error = error
        
        else
        {
            self.transitionBack()
            
            return
        }
        
        ViewAlert.messageFail(message:error.localizedDescription)

        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = true
    }
    
    //MARK: internal
    
    func selectIngredient(ingredient:Ingredient)
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = false
        
        self.model.selectIngredient(ingredient:ingredient)
        { [weak self] (error:Error?) in
            
            self?.ingredientSelected(error:error)
        }
    }
}
