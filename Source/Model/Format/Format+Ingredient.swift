import Foundation

extension Format
{
    static var typeMap:[IngredientAmountType:FormatIngredientTypeProtocol.Type]
    {
        get
        {
            let map:[IngredientAmountType:FormatIngredientTypeProtocol.Type] = [
                IngredientAmountType.cups : FormatIngredientTypeCups.self,
                IngredientAmountType.grams : FormatIngredientTypeGrams.self,
                IngredientAmountType.mililitres : FormatIngredientTypeMililitres.self,
                IngredientAmountType.quantity : FormatIngredientTypeQuantity.self,
                IngredientAmountType.spoons : FormatIngredientTypeSpoons.self]
            
            return map
        }
    }
}
