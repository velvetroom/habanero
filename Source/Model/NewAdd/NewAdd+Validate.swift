import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncValidate(completion:@escaping((Error?) -> ()))
    {
        
    }
    
    //MARK: internal
    
    func validate(completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncValidate(completion:completion)
        }
    }
}
