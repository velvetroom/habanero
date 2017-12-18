import Foundation

struct FormatIngredientTypeSpoons:FormatIngredientTypeProtocol
{
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let buildIngredient:BuildIngredientSpoons = buildIngredient as? BuildIngredientSpoons
            
        else
        {
            return nil
        }
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeSpoons.Constants.maxDecimals)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeSpoons_suffix")
        
        let number:NSNumber = buildIngredient.spoons as NSNumber
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
}
