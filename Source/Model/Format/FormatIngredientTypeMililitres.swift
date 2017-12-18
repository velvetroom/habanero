import Foundation

struct FormatIngredientTypeMililitres:FormatIngredientTypeProtocol
{
    private static var lowerMetricsRouter:[SettingsMetrics : ((Int) -> (String?))]
    {
        get
        {
            let map:[SettingsMetrics : ((Int) -> (String?))] = [
                SettingsMetrics.international : FormatIngredientTypeMililitres.factoryMililitres,
                SettingsMetrics.imperial : FormatIngredientTypeMililitres.factoryFluidOunces]
            
            return map
        }
    }
    
    private static var upperMetricsRouter:[SettingsMetrics : ((Int) -> (String?))]
    {
        get
        {
            let map:[SettingsMetrics : ((Int) -> (String?))] = [
                SettingsMetrics.international : FormatIngredientTypeMililitres.factoryLitres,
                SettingsMetrics.imperial : FormatIngredientTypeMililitres.factoryGallons]
            
            return map
        }
    }
    
    //MARK: private
    
    private static func factoryRouter(
        mililitres:Int,
        metrics:SettingsMetrics) -> ((Int) -> (String?))?
    {
        let router:((Int) -> (String?))?
        
        if mililitres > FormatIngredientTypeMililitres.Constants.thousand
        {
            router = FormatIngredientTypeMililitres.upperMetricsRouter[metrics]
        }
        else
        {
            router = FormatIngredientTypeMililitres.lowerMetricsRouter[metrics]
        }
        
        return router
    }
    
    private static func factoryLitres(mililitres:Int) -> String?
    {
        let mililitresFloat:Float = Float(mililitres)
        let litres:Float = mililitresFloat / FormatIngredientTypeMililitres.Constants.milisPerLitre
        let number:NSNumber = litres as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeMililitres.Constants.decimalsUpperMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeMililitres_litres")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    private static func factoryMililitres(mililitres:Int) -> String?
    {
        let number:NSNumber = mililitres as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeMililitres.Constants.decimalsLowerMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeMililitres_mililitres")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    private static func factoryGallons(mililitres:Int) -> String?
    {
        let mililitresFloat:Float = Float(mililitres)
        let gallons:Float = mililitresFloat / FormatIngredientTypeMililitres.Constants.milisPerGallon
        let number:NSNumber = gallons as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeMililitres.Constants.decimalsUpperMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeMililitres_gallons")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    private static func factoryFluidOunces(mililitres:Int) -> String?
    {
        let mililitresFloat:Float = Float(mililitres)
        let fluidOunces:Float = mililitresFloat / FormatIngredientTypeMililitres.Constants.milisPerFluidOunce
        let number:NSNumber = fluidOunces as NSNumber
        
        let formatter:NumberFormatter = Format.factoryFormatter(
            decimals:FormatIngredientTypeMililitres.Constants.decimalsLowerMetrics)
        formatter.positiveSuffix = String.localizedModel(key:"FormatIngredientTypeMililitres_fluidOunces")
        
        let amount:String? = formatter.string(from:number)
        
        return amount
    }
    
    //MARK: internal
    
    static func factoryAmount(
        buildIngredient:BuildIngredient,
        settings:Settings) -> String?
    {
        guard
            
            let buildIngredient:BuildIngredientMililitres = buildIngredient as? BuildIngredientMililitres
            
        else
        {
            return nil
        }
        
        let mililitres:Int = Int(buildIngredient.mililitres)
        
        guard
            
            let router:((Int) -> (String?)) = FormatIngredientTypeMililitres.factoryRouter(
                mililitres:mililitres,
                metrics:settings.metrics)
            
        else
        {
            return nil
        }
        
        let amount:String? = router(mililitres)
        
        return amount
    }
}
