import UIKit

extension Storage
{
    //MARK: private
    
    private func dataReceived(
        data:Data,
        completion:((UIImage?, Error?) -> ()))
    {
        guard
        
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
        
            guard
            
                error == nil,
                let data:Data = data
            
            else
            {
                completion(nil, error)
                
                return
            }
            
            self?.dataReceived(
                data:data,
                completion:completion)
        }
    }
}
