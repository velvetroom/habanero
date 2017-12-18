import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping((Error?) -> ()))
    {
        self.cloud.loadList
        { [weak self] (ingredientList:IngredientList?, error:Error?) in
            
            let ingredients:[Ingredient]? = ingredientList?.items.sorted
            { (itemA:Ingredient, itemB:Ingredient) -> Bool in
                
                let comparisonResult:ComparisonResult = itemA.name.compare(itemB.name)
                
                if comparisonResult == ComparisonResult.orderedDescending
                {
                    return false
                }
                
                return true
            }
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.loadCompleted(
                    ingredients:ingredients,
                    error:error,
                    completion:completion)
            }
        }
    }
    
    private func loadCompleted(
        ingredients:[Ingredient]?,
        error:Error?,
        completion:((Error?) -> ()))
    {
        guard
        
            error == nil,
            let ingredients:[Ingredient] = ingredients
        
        else
        {
            completion(error)
            
            return
        }
        
        self.updateItems(ingredients:ingredients)
        
        completion(nil)
    }
    
    //MARK: internal
    
    func load(completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad(completion:completion)
        }
    }
}
