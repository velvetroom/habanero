import Foundation

extension CookItem
{
    //MARK: private
    
    private func asyncLoadIngredientsFor(cloud:Cloud)
    {
        cloud.loadRecipeIngredients(recipe:self.recipe)
        { [weak self] (ingredientList:RecipeIngredientsList?, error:Error?) in
            
            guard
                
                error == nil,
                let ingredientList:RecipeIngredientsList = ingredientList
                
            else
            {
                return
            }
            
            self?.ingredients = ingredientList.items
        }
    }
    
    //MARK: internal
    
    func loadIngredientsFor(cloud:Cloud)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadIngredientsFor(cloud:cloud)
        }
    }
}
