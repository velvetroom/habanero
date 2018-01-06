import Foundation

extension Cloud
{
    private static var ingredientTypeRouter:[IngredientAmountType : ((BuildIngredient) -> ([String:Any]?))]
    {
        get
        {
            let map:[IngredientAmountType : ((BuildIngredient) -> ([String:Any]?))] = [
                IngredientAmountType.cups : Cloud.ingredientCups,
                IngredientAmountType.grams : Cloud.ingredientGrams,
                IngredientAmountType.mililitres : Cloud.ingredientMililitres,
                IngredientAmountType.quantity : Cloud.ingredientQuantity,
                IngredientAmountType.spoons : Cloud.ingredientSpoons]
            
            return map
        }
    }
    
    //MARK: private
    
    private class func ingredientCups(ingredient:BuildIngredient) -> [String:Any]?
    {
        guard
        
            let ingredient:BuildIngredientCups = ingredient as? BuildIngredientCups,
            let ingredientIdentifier:String = ingredient.ingredientIdentifier,
            let ingredientName:String = ingredient.name
        
        else
        {
            return nil
        }
        
        var builder:RecipeIngredientCupsBuilder = RecipeIngredientCupsBuilder()
        builder.cups = ingredient.cups
        builder.ingredientIdentifier = ingredientIdentifier
        builder.ingredientName = ingredientName
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    private class func ingredientGrams(ingredient:BuildIngredient) -> [String:Any]?
    {
        guard
            
            let ingredient:BuildIngredientGrams = ingredient as? BuildIngredientGrams,
            let ingredientIdentifier:String = ingredient.ingredientIdentifier,
            let ingredientName:String = ingredient.name
            
        else
        {
            return nil
        }
        
        var builder:RecipeIngredientGramsBuilder = RecipeIngredientGramsBuilder()
        builder.grams = Int(ingredient.grams)
        builder.ingredientIdentifier = ingredientIdentifier
        builder.ingredientName = ingredientName
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    private class func ingredientMililitres(ingredient:BuildIngredient) -> [String:Any]?
    {
        guard
            
            let ingredient:BuildIngredientMililitres = ingredient as? BuildIngredientMililitres,
            let ingredientIdentifier:String = ingredient.ingredientIdentifier,
            let ingredientName:String = ingredient.name
            
        else
        {
            return nil
        }
        
        var builder:RecipeIngredientMililitresBuilder = RecipeIngredientMililitresBuilder()
        builder.mililitres = Int(ingredient.mililitres)
        builder.ingredientIdentifier = ingredientIdentifier
        builder.ingredientName = ingredientName
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    private class func ingredientQuantity(ingredient:BuildIngredient) -> [String:Any]?
    {
        guard
            
            let ingredient:BuildIngredientQuantity = ingredient as? BuildIngredientQuantity,
            let ingredientIdentifier:String = ingredient.ingredientIdentifier,
            let ingredientName:String = ingredient.name
            
        else
        {
            return nil
        }
        
        var builder:RecipeIngredientQuantityBuilder = RecipeIngredientQuantityBuilder()
        builder.quantity = ingredient.quantity
        builder.ingredientIdentifier = ingredientIdentifier
        builder.ingredientName = ingredientName
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    private class func ingredientSpoons(ingredient:BuildIngredient) -> [String:Any]?
    {
        guard
            
            let ingredient:BuildIngredientSpoons = ingredient as? BuildIngredientSpoons,
            let ingredientIdentifier:String = ingredient.ingredientIdentifier,
            let ingredientName:String = ingredient.name
            
        else
        {
            return nil
        }
        
        var builder:RecipeIngredientSpoonsBuilder = RecipeIngredientSpoonsBuilder()
        builder.spoons = Int(ingredient.spoons)
        builder.ingredientIdentifier = ingredientIdentifier
        builder.ingredientName = ingredientName
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    //MARK: internal
    
    func createRecipeIngredient(
        ingredient:BuildIngredient,
        for recipe:Recipe,
        completion:@escaping((String?, Error?) -> ()))
    {
        guard
            
            let router:((BuildIngredient) -> ([String:Any]?)) =
                Cloud.ingredientTypeRouter[ingredient.ingredientAmountType],
            let json:[String:Any] = router(ingredient)
        
        else
        {
            return
        }
        
        self.provider.createItemAt(
            listKey:Recipe.Keys.ingredients,
            of:recipe,
            with:json,
            completion:completion)
    }
}
