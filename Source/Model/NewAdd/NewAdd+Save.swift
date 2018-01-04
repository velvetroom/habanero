import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncSave(completion:@escaping((Error?) -> ()))
    {
        
    }
    
    private func finishSaving(
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
