import Foundation

struct FormatIngredientTypeSpoons:FormatIngredientTypeProtocol
{
    //MARK: private
    
    private static func factoryAmount(spoons:Int) -> String?
    {
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeSpoons.Constants.maxDecimals)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeSpoons_suffix")
        
        let number:NSNumber = spoons as NSNumber
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
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
        
        let spoons:Int = Int(buildIngredient.spoons)
        
        let amount:String? = FormatIngredientTypeSpoons.factoryAmount(spoons:spoons)
        
        return amount
    }
    
    static func factoryAmount(
        recipeIngredient:RecipeIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let recipeIngredient:RecipeIngredientSpoons = recipeIngredient as? RecipeIngredientSpoons
            
        else
        {
            return nil
        }
        
        let amount:String? = FormatIngredientTypeSpoons.factoryAmount(spoons:recipeIngredient.spoons)
        
        return amount
    }
}
