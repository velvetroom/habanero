import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping((Error?) -> ()))
    {
        self.cloud.loadList
        { [weak self] (ingredientList:IngredientList?, error:Error?) in
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.loadCompleted(
                    ingredientList:ingredientList,
                    error:error,
                    completion:completion)
            }
        }
    }
    
    private func loadCompleted(
        ingredientList:IngredientList?,
        error:Error?,
        completion:((Error?) -> ()))
    {
        guard
        
            error == nil,
            let ingredientList:IngredientList = ingredientList
        
        else
        {
            completion(error)
            
            return
        }
        
        self.updateItems(ingredients:ingredientList.items)
        
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
