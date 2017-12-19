import Foundation

extension Build
{
    var ingredientList:[BuildIngredient]?
    {
        get
        {
            let list:[BuildIngredient]? = self.ingredients?.array as? [BuildIngredient]
            
            return list
        }
    }
    
    var stepList:[BuildStep]?
    {
        get
        {
            let list:[BuildStep]? = self.steps?.array as? [BuildStep]
            
            return list
        }
    }
}
