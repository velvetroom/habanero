import Foundation

extension ControllerNewAddIngredient
{
    //MARK: private
    
    private func ingredientSelectedError(error:Error)
    {
        ViewAlert.messageFail(message:error.localizedDescription)

        self.viewMain.viewBar.searchBar.isUserInteractionEnabled = true
    }
    
    private func ingredientSelectContinue(ingredient:Ingredient)
    {
        guard
        
            let build:Build = self.model.build,
            let database:Database = self.model.database
        
        else
        {
            return
        }
        
        let controller:ControllerNewAddIngredientAmount = ControllerNewAddIngredientAmount(
            ingredient:ingredient,
            build:build,
            database:database)
        
        self.parentController?.push(
            controller:controller,
            horizontal:ControllerTransition.Horizontal.right)
        { [weak self] in
 
            self?.viewMain.viewList.collectionView.reloadData()
        }
    }
    
    //MARK: internal
    
    func selectIngredient(ingredient:Ingredient)
    {
        self.viewMain.viewBar.searchBar.resignFirstResponder()
        
        let isValid:Bool = self.model.validateIngredient(ingredient:ingredient)
        
        if isValid
        {
            self.ingredientSelectContinue(ingredient:ingredient)
        }
        else
        {
            self.ingredientSelectedError(error:NewAddIngredientError.ingredientAlreadyAdded)
        }
    }
}
