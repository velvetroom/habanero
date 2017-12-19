import Foundation

extension Format
{
    private static var typeMap:[IngredientAmountType:FormatIngredientTypeProtocol.Type]
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
    
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let formatter:FormatIngredientTypeProtocol.Type = Format.typeMap[buildIngredient.ingredientAmountType]
        
        else
        {
            return nil
        }
        
        let amount:String? = formatter.factoryAmount(
            buildIngredient:buildIngredient,
            settings:settings)
        
        return amount
    }
}
