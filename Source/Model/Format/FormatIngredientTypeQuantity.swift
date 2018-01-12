import Foundation

struct FormatIngredientTypeQuantity:FormatIngredientTypeProtocol
{
    //MARK: private
    
    private static func factoryAmount(
        quantity:Float,
        settings:Settings) -> String?
    {
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeQuantity.Constants.maxDecimals)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeQuantity_suffix")
        
        let number:NSNumber = quantity as NSNumber
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
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
        
        let amount:String? = FormatIngredientTypeQuantity.factoryAmount(
            quantity:buildIngredient.quantity,
            settings:settings)
        
        return amount
    }
    
    static func factoryAmount(
        recipeIngredient:RecipeIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let recipeIngredient:RecipeIngredientQuantity = recipeIngredient as? RecipeIngredientQuantity
            
        else
        {
            return nil
        }
        
        let amount:String? = FormatIngredientTypeQuantity.factoryAmount(
            quantity:recipeIngredient.quantity,
            settings:settings)
        
        return amount
    }
}
