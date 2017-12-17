import Foundation

struct FormatIngredientTypeCups:FormatIngredientTypeProtocol
{
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
        
            let buildIngredient:BuildIngredientCups = buildIngredient as? BuildIngredientCups
        
        else
        {
            return nil
        }
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeCups.Constants.maxDecimals)
        formatter.positiveSuffix = String.localizedView(key:"FormatIngredientTypeCups_suffix")
        let number:NSNumber = buildIngredient.cups as NSNumber
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
}
