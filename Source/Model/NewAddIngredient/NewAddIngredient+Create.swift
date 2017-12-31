import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    private func asyncCreateIngredient(completion:@escaping((Ingredient?, Error?) -> ()))
    {
        let nameLength:Int = self.searching.count
        
        guard
        
            nameLength > 0
        
        else
        {
            self.ingredientCreated(
                ingredient:nil,
                error:nil,
                completion:completion)
            
            return
        }
        
        let ingredientName:String = self.searching.lowercased()
        
        self.cloud.createIngredient(name:ingredientName)
        { [weak self] (identifier:String?, error:Error?) in
            
            guard
            
                let identifier:String = identifier
            
            else
            {
                self?.ingredientCreated(
                    ingredient:nil,
                    error:error,
                    completion:completion)
                
                return
            }
            
            self?.loadIngredient(
                identifier:identifier,
                completion:completion)
        }
    }
    
    private func loadIngredient(
        identifier:String,
        completion:@escaping((Ingredient?, Error?) -> ()))
    {
        self.cloud.loadItem(
            parentPath:IngredientList.identifier,
            identifier:identifier)
        { [weak self] (ingredient:Ingredient?, error:Error?) in
            
            self?.ingredientCreated(
                ingredient:ingredient,
                error:error,
                completion:completion)
        }
    }
    
    private func ingredientCreated(
        ingredient:Ingredient?,
        error:Error?,
        completion:@escaping((Ingredient?, Error?) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(ingredient, error)
        }
    }
    
    //MARK: internal
    
    func createIngredient(completion:@escaping((Ingredient?, Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCreateIngredient(completion:completion)
        }
    }
}
