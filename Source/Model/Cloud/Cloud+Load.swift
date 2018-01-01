import Foundation

extension Cloud
{
    //MARK: internal
    
    func loadIngredients(completion:@escaping((IngredientList?, Error?) -> ()))
    {
        self.provider.loadList(
            identifier:IngredientList.identifier,
            completion:completion)
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
}
