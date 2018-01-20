import Foundation

extension Format
{
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
