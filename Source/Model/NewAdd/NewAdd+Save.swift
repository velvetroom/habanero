import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncSave(completion:@escaping((Error?) -> ()))
    {
        self.createRecipe
        { [weak self] (recipeIdentifier:String?, error:Error?) in
            
            guard
            
                let error:Error = error
            
            else
            {
                
                guard
                    
                    let recipeIdentifier:String = recipeIdentifier
                    
                else
                {
                    return
                }
                
                self?.recipeCreated(
                    recipeIdentifier:recipeIdentifier,
                    completion:completion)
                
                
                return
            }
            
            self?.finishedSaving(
                error:error,
                completion:completion)
        }
    }
    
    private func createRecipe(completion:@escaping((String?, Error?) -> ()))
    {
        guard
            
            let build:Build = self.build
        
        else
        {
            return
        }
        
        self.cloud.createRecipe(
            build:build,
            completion:completion)
    }
    
    private func recipeCreated(
        recipeIdentifier:String,
        completion:@escaping((Error?) -> ()))
    {
        guard
        
            let build:Build = self.build
        
        else
        {
            return
        }
        
        self.storage.saveRecipeImage(
            recipeIdentifier:recipeIdentifier,
            build:build)
        { [weak self] (error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                self?.finishedSaving(
                    error:error,
                    completion:completion)
                
                return
            }
            
            self?.saveIngredients(
                recipeIdentifier:recipeIdentifier,
                completion:completion)
        }
    }
    
    private func finishedSaving(
        error:Error?,
        completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(error)
        }
    }
    
    //MARK: internal
    
    func save(completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSave(completion:completion)
        }
    }
}
