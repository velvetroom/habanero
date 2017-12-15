import Foundation

extension NewAddIngredient
{
    //MARK: internal
    
    func validateIngredient(ingredient:Ingredient) -> Bool
    {
        guard
            
            let ingredientList:[BuildIngredient] = self.build?.ingredientList
            
        else
        {
            return false
        }
        
        for listedIngredient:BuildIngredient in ingredientList
        {
            if ingredient.identifier == listedIngredient.cloudId
            {
                return false
            }
        }
        
        return true
    }
}
