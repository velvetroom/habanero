import Foundation

extension NewAddIngredientError:LocalizedError
{
    var errorDescription:String?
    {
        get
        {
            let map:[NewAddIngredientError:String] = NewAddIngredientError.descriptionMap()
            let localizedDescription:String? = map[self]
            
            return localizedDescription
        }
    }
    
    //MARK: private
    
    private static func descriptionMap() -> [NewAddIngredientError:String]
    {
        let map:[NewAddIngredientError:String] = [
            NewAddIngredientError.ingredientAlreadyAdded : String.localizedError(key:"NewAddIngredientError_ingredientAlreadyAdded")]
        
        return map
    }
}
