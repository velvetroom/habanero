import Foundation

struct FormatIngredientTypeQuantity:FormatIngredientTypeProtocol
{
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let buildIngredient:BuildIngredientQuantity = buildIngredient as? BuildIngredientQuantity
            
        else
        {
            return nil
        }
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeQuantity.Constants.maxDecimals)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeQuantity_suffix")
        
        let number:NSNumber = buildIngredient.quantity as NSNumber
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
}
