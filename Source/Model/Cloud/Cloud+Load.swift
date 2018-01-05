import Foundation

extension Cloud
{
    //MARK: internal
    
    func loadIngredients(completion:@escaping((IngredientList?, Error?) -> ()))
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
}
