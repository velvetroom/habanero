import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    func asynCreateIngredient(completion:@escaping(() -> ()))
    {
        
    }
    
    //MARK: internal
    
    func createIngredient(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asynCreateIngredient(completion:completion)
        }
    }
}
