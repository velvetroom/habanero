import Foundation

extension NewAdd
{
    //MARK: internal
    
    func save(completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.createRecipe(completion:completion)
        }
    }
    
    func finishedSaving(
        error:Error?,
        completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(error)
        }
    }
}
