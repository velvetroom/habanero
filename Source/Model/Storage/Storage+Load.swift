import UIKit

extension Storage
{
    //MARK: private
    
    private func dataReceived(
        data:Data?,
        error:Error?,
        completion:((UIImage?, Error?) -> ()))
    {
        guard
        
            error == nil,
            let data:Data = data,
            data.count > 0,
            let image:UIImage = UIImage(data:data)
        
        else
        {
            completion(nil, StorageError.malformedData)
            
            return
        }
        
        completion(image, nil)
    }
    
    //MARK: internal
    
    func loadRecipeImage(
        recipe:Recipe,
        completion:@escaping((UIImage?, Error?) -> ()))
    {
        self.provider.load(
            identifier:recipe.identifier,
            at:StorageContainer.recipe)
        { [weak self] (data:Data?, error:Error?) in
            
            self?.dataReceived(
                data:data,
                error:error,
                completion:completion)
        }
    }
    
    func loadStepImage(
        recipe:Recipe,
        stepIdentifier:String,
        completion:@escaping((UIImage?, Error?) -> ()))
    {
        self.provider.load(
            identifier:stepIdentifier,
            at:recipe.identifier,
            of:StorageContainer.recipeSteps)
        { [weak self] (data:Data?, error:Error?) in
            
            self?.dataReceived(
                data:data,
                error:error,
                completion:completion)
        }
    }
}
