import Foundation

extension BuildIngredient
{
    var ingredientAmountType:IngredientAmountType
    {
        get
        {
            guard
            
                let ingredientType:IngredientAmountType = IngredientAmountType(
                    rawValue:self.rawIngredientAmountType)
            
            else
            {
                return IngredientAmountType.quantity
            }
            
            return ingredientType
        }
    }
}
