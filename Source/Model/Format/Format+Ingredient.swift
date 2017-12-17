import Foundation

extension Format
{
    private static var typeMap:[IngredientType:FormatIngredientTypeProtocol.Type]
    {
        get
        {
            let map:[IngredientType:FormatIngredientTypeProtocol.Type] = [
                IngredientType.cups : FormatIngredientTypeCups.self,
                IngredientType.grams : FormatIngredientTypeGrams.self,
                IngredientType.mililitres : FormatIngredientTypeMililitres.self,
                IngredientType.quantity : FormatIngredientTypeQuantity.self,
                IngredientType.spoons : FormatIngredientTypeSpoons.self]
            
            return map
        }
    }
    
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let formatter:FormatIngredientTypeProtocol.Type = Format.typeMap[buildIngredient.ingredientType]
        
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
