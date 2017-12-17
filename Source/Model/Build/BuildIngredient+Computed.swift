import Foundation

extension BuildIngredient
{
    var ingredientType:IngredientType
    {
        get
        {
            guard
            
                let ingredientType:IngredientType = IngredientType(rawValue:self.rawIngredientType)
            
            else
            {
                return IngredientType.quantity
            }
            
            return ingredientType
        }
    }
}
