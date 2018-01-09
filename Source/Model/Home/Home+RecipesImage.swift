import UIKit

extension Home
{
    //MARK: private
    
    private func asyncLoadRecipeImage(
        recipe:Recipe,
        completion:@escaping((UIImage) -> ()))
    {
        self.storage.loadRecipeImage(recipe:recipe)
        { [weak self] (image:UIImage?, error:Error?) in
            
            guard
            
                error == nil,
                let image:UIImage = image
            
            else
            {
                return
            }
            
            self?.receivedImage(
                image:image,
                completion:completion)
        }
    }
    
    private func receivedImage(
        image:UIImage,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.main.async
        {   
            completion(image)
        }
    }
    
    //MARK: internal
    
    func loadRecipeImage(
        recipe:Recipe,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadRecipeImage(
                recipe:recipe,
                completion:completion)
        }
    }
}
