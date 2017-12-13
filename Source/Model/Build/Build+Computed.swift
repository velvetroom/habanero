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
}
