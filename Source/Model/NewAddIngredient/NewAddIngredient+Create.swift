import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    func asynCreateIngredient(completion:@escaping((Ingredient?, Error?) -> ()))
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
        
        let ingredientData:[String:Any] = Ingredient.factoryJson(name:self.searching)
        
        self.cloud.create(
            parentPath:IngredientList.identifier,
            data:ingredientData)
        { (identifier:String?, error:Error?) in
            
            guard
            
                let identifier:String = identifier
            
            else
            {
                self.ingredientCreated(
                    ingredient:nil,
                    error:error,
                    completion:completion)
                
                return
            }
        }
    }
    
    private func loadIngredient(identifier:String)
    {
        
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
            
            self?.asynCreateIngredient(completion:completion)
        }
    }
}
