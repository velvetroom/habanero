import Foundation

extension Cloud
{
    //MARK: internal
    
    func loadIngredients(completion:@escaping((IngredientList?, Error?) -> ()))
    {
        self.provider.loadList(completion:completion)
    }
    
    func loadRecipes(completion:@escaping((RecipeList?, Error?) -> ()))
    {
        self.provider.loadList(completion:completion)
    }
    
    func loadIngredient(
        identifier:String,
        completion:@escaping((Ingredient?, Error?) -> ()))
    {
        let ingredientList:IngredientList = IngredientList()
        
        self.provider.loadItem(
            identifier:identifier,
            of:ingredientList,
            completion:completion)
    }
    
    func loadRecipe(
        identifier:String,
        completion:@escaping((Recipe?, Error?) -> ()))
    {
        let recipeList:RecipeList = RecipeList()
        
        self.provider.loadItem(
            identifier:identifier,
            of:recipeList,
            completion:completion)
    }
    
    func loadRecipeStep(
        identifier:String,
        from recipe:Recipe,
        completion:@escaping((RecipeStep?, Error?) -> ()))
    {
        self.provider.loadItem(
            identifier:identifier,
            at:Recipe.Keys.steps,
            of:recipe,
            completion:completion)
    }
    
    func loadRecipeIngredients(
        recipe:Recipe,
        completion:@escaping(([RecipeIngredient]?, Error?) -> ()))
    {
        self.provider.loadList(
            listKey:Recipe.Keys.ingredients,
            of:recipe)
        { (<#CloudListProtocol?#>, <#Error?#>) in
                <#code#>
        }
    }
}
