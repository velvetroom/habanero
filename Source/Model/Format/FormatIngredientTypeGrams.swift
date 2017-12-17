import Foundation

struct FormatIngredientTypeGrams:FormatIngredientTypeProtocol
{
    private static var lowerMetricsRouter:[SettingsMetrics : ((Int) -> (String?))]
    {
        get
        {
            let map:[SettingsMetrics : ((Int) -> (String?))] = [
                SettingsMetrics.international : FormatIngredientTypeGrams.factoryGrams,
                SettingsMetrics.imperial : FormatIngredientTypeGrams.factoryOunces]
            
            return map
        }
    }
    
    private static var upperMetricsRouter:[SettingsMetrics : ((Int) -> (String?))]
    {
        get
        {
            let map:[SettingsMetrics : ((Int) -> (String?))] = [
                SettingsMetrics.international : FormatIngredientTypeGrams.factoryKilograms,
                SettingsMetrics.imperial : FormatIngredientTypeGrams.factoryPounds]
            
            return map
        }
    }
    
    //MARK: private
    
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
        
    }
    
    private static func factoryGrams(grams:Int) -> String?
    {
        
    }
    
    private static func factoryPounds(grams:Int) -> String?
    {
        
    }
    
    private static func factoryOunces(grams:Int) -> String?
    {
        
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
}
