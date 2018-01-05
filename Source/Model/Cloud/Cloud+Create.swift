import Foundation

extension Cloud
{
    //MARK: private
    
    private class func recipeBuilder(build:Build) -> RecipeBuilder
    {
        var recipeBuilder:RecipeBuilder = RecipeBuilder()
        
        if let created:TimeInterval = build.created?.timeIntervalSince1970
        {
            recipeBuilder.created = created
        }
        
        if let syncstamp:TimeInterval = build.created?.timeIntervalSince1970
        {
            recipeBuilder.syncstamp = syncstamp
        }
        
        if let title:String = build.title
        {
            recipeBuilder.title = title
        }
        
        if let subtitle:String = build.subtitle
        {
            recipeBuilder.subtitle = subtitle
        }
        
        recipeBuilder.duration = build.duration
        recipeBuilder.status = RecipeStatus.saving
        
        return recipeBuilder
    }
    
    //MARK: internal
    
    func createIngredient(
        name:String,
        completion:@escaping((String?, Error?) -> ()))
    {
        var ingredientBuilder:IngredientBuilder = IngredientBuilder()
        ingredientBuilder.name = name
        
        let ingredientData:[String:Any] = ingredientBuilder.json
        let ingredientList:IngredientList = IngredientList()
        
        self.provider.createItemAt(
            entity:ingredientList,
            with:ingredientData,
            completion:completion)
    }
    
    func createRecipe(
        build:Build,
        completion:@escaping((String?, Error?) -> ()))
    {
        let recipeBuilder:RecipeBuilder = Cloud.recipeBuilder(build:build)
        let recipeData:[String:Any] = recipeBuilder.json
        let recipeList:RecipeList = RecipeList()
        
        self.provider.createItemAt(
            entity:recipeList,
            with:recipeData,
            completion:completion)
    }
}
