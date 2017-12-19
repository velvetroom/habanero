import Foundation

extension BuildIngredient
{
    var ingredientType:IngredientAmountType
    {
        get
        {
            guard
            
                let ingredientType:IngredientAmountType = IngredientAmountType(
                    rawValue:self.rawIngredientType)
            
            else
            {
                return IngredientAmountType.quantity
            }
            
            return ingredientType
        }
    }
}
