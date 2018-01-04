import Foundation

extension Cloud
{
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
            width:ingredientData,
            completion:completion)
    }
}
