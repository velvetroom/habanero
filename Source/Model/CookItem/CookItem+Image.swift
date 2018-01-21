import UIKit

extension CookItem
{
    //MARK: private
    
    private func asyncLoadRecipeImage(
        storage:Storage,
        completion:@escaping((UIImage) -> ()))
    {
        storage.loadRecipeImage(recipe:self.recipe)
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
        self.image = image
        
        DispatchQueue.main.async
        {
            completion(image)
        }
    }
    
    //MARK: internal
    
    func loadImage(
        storage:Storage,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadRecipeImage(
                storage:storage,
                completion:completion)
        }
    }
}
