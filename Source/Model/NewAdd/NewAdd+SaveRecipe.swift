import Foundation

extension NewAdd
{
    //MARK: private
    
    private func recipeCreated(
        identifier:String,
        completion:@escaping((Error?) -> ()))
    {
        self.cloud.loadRecipe(identifier:identifier)
        { [weak self] (recipe:Recipe?, error:Error?) in
            
            guard
            
                error == nil,
                let recipe:Recipe = recipe
            
            else
            {
                return
            }
            
            self?.saveImage(
                recipe:recipe,
                completion:completion)
        }
    }
    
    private func saveImage(
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let build:Build = self.build
            
        else
        {
            return
        }
        
        self.storage.saveRecipeImage(
            recipe:recipe,
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
    
    //MARK: internal
    
    func createRecipe(completion:@escaping((Error?) -> ()))
    {
        guard
            
            let build:Build = self.build
            
        else
        {
            return
        }
        
        self.cloud.createRecipe(build:build)
        { [weak self] (identifier:String?, error:Error?) in
            
            guard
                
                error == nil,
                let identifier:String = identifier
                
            else
            {
                self?.finishedSaving(
                    error:error,
                    completion:completion)
                
                return
            }
            
            self?.recipeCreated(
                identifier:identifier,
                completion:completion)
        }
    }
}
