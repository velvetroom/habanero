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
        
            let build:Build = self.model.build
        
        else
        {
            return
        }
        
        let controller:ControllerNewAddIngredientAmount = ControllerNewAddIngredientAmount(
            ingredient:ingredient,
            build:build)
        
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
