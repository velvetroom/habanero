import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadIngredientsFor(item:HomeItem)
    {
        self.cloud.loadRecipeIngredients(recipe:item.recipe)
        { (ingredientList:RecipeIngredientsList?, error:Error?) in
            
            guard
            
                error == nil,
                let ingredientList:RecipeIngredientsList = ingredientList
            
            else
            {
                return
            }
            
            item.ingredients = ingredientList.items
        }
    }
    
    //MARK: internal
    
    func loadIngredientsFor(item:HomeItem)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadIngredientsFor(item:item)
        }
    }
}
