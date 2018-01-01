import Foundation

extension Cloud
{
    //MARK: internal
    
    func createIngredient(
        name:String,
        completion:@escaping((String?, Error?) -> ()))
    {
        let ingredientData:[String:Any] = Ingredient.factoryJson(name:name)
        let ingredientList:IngredientList = IngredientList()
        
        self.provider.createItemAt(
            entity:ingredientList,
            width:ingredientData,
            completion:completion)
    }
}
