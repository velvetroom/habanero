import Foundation

struct FormatIngredientTypeGrams:FormatIngredientTypeProtocol
{
    private static var lowerMetricsRouter:[SettingsMetrics : ((Int) -> (String?))]
    {
        get
        {
            let map:[SettingsMetrics : ((Int) -> (String?))] = [
                SettingsMetrics.international : FormatIngredientTypeGrams.factoryGrams,
                SettingsMetrics.us : FormatIngredientTypeGrams.factoryOunces]
            
            return map
        }
    }
    
    private static var upperMetricsRouter:[SettingsMetrics : ((Int) -> (String?))]
    {
        get
        {
            let map:[SettingsMetrics : ((Int) -> (String?))] = [
                SettingsMetrics.international : FormatIngredientTypeGrams.factoryKilograms,
                SettingsMetrics.us : FormatIngredientTypeGrams.factoryPounds]
            
            return map
        }
    }
    
    //MARK: private
    
    private static func factoryAmount(
        grams:Int,
        settings:Settings) -> String?
    {
        guard
            
            let router:((Int) -> (String?)) = FormatIngredientTypeGrams.factoryRouter(
                grams:grams,
                metrics:settings.metrics)
            
        else
        {
            return nil
        }
        
        let amount:String? = router(grams)
        
        return amount
    }
    
    private static func factoryRouter(
        grams:Int,
        metrics:SettingsMetrics) -> ((Int) -> (String?))?
    {
        let router:((Int) -> (String?))?
        
        if grams > FormatIngredientTypeGrams.Constants.thousand
        {
            router = FormatIngredientTypeGrams.upperMetricsRouter[metrics]
        }
        else
        {
            router = FormatIngredientTypeGrams.lowerMetricsRouter[metrics]
        }
        
        return router
    }
    
    private static func factoryKilograms(grams:Int) -> String?
    {
        let gramsFloat:Float = Float(grams)
        let kilograms:Float = gramsFloat / FormatIngredientTypeGrams.Constants.gramsPerKilogram
        let number:NSNumber = kilograms as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeGrams.Constants.decimalsUpperMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeGrams_kilograms")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    private static func factoryGrams(grams:Int) -> String?
    {
        let number:NSNumber = grams as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeGrams.Constants.decimalsLowerMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeGrams_grams")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    private static func factoryPounds(grams:Int) -> String?
    {
        let gramsFloat:Float = Float(grams)
        let pounds:Float = gramsFloat / FormatIngredientTypeGrams.Constants.gramsPerPound
        let number:NSNumber = pounds as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeGrams.Constants.decimalsUpperMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeGrams_pounds")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    private static func factoryOunces(grams:Int) -> String?
    {
        let gramsFloat:Float = Float(grams)
        let pounds:Float = gramsFloat / FormatIngredientTypeGrams.Constants.gramsPerOunce
        let number:NSNumber = pounds as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeGrams.Constants.decimalsLowerMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeGrams_ounces")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let buildIngredient:BuildIngredientGrams = buildIngredient as? BuildIngredientGrams
            
        else
        {
            return nil
        }
        
        let grams:Int = Int(buildIngredient.grams)
        let amount:String? = FormatIngredientTypeGrams.factoryAmount(
            grams:grams,
            settings:settings)
        
        return amount
    }
    
    static func factoryAmount(
        recipeIngredient:RecipeIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let recipeIngredient:RecipeIngredientGrams = recipeIngredient as? RecipeIngredientGrams
            
        else
        {
            return nil
        }
        
        let amount:String? = FormatIngredientTypeGrams.factoryAmount(
            grams:recipeIngredient.grams,
            settings:settings)
        
        return amount
    }
}
