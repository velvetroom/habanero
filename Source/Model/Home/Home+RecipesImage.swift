import UIKit

extension Home
{
    //MARK: private
    
    private func asyncLoadRecipeImage(
        recipe:Recipe,
        completion:@escaping((UIImage) -> ()))
    {
        self.storage.
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
