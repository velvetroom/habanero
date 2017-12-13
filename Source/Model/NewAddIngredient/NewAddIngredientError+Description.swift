import Foundation

extension NewAddIngredientError
{
    var localizedDescription:String?
    {
        get
        {
            let map:[NewAddIngredientError:String] = NewAddIngredientError.descriptionMap()
            let localizedDescription:String? = map[self]
            
            return localizedDescription
        }
    }
    
    //MARK: private
    
    private static func descriptionMap() -> [CloudError:String]
    {
        let map:[CloudError:String] = [
            NewAddIngredientError.ingredientAlreadyAdded : String.localizedError(key:"NewAddIngredientError_ingredientAlreadyAdded")
        
        return map
    }
}
