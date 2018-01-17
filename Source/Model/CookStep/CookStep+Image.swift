import UIKit

extension CookStep
{
    //MARK: private
    
    private func asyncLoadStepImage(
        item:CookStepItemImage,
        completion:@escaping((UIImage) -> ()))
    {
        guard
            
            let recipe:Recipe = self.homeItem?.recipe
        
        else
        {
            return
        }
        
        self.storage.loadStepImage(
            recipe:recipe,
            stepIdentifier:item.stepIdentifier)
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
    
    func loadStepImage(
        item:CookStepItemImage,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadStepImage(
                item:item,
                completion:completion)
        }
    }
}
