import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadSettings(completion:@escaping(() -> ()))
    {
        
    }
    
    //MARK: internal
    
    func loadSettings(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadSettings(completion:completion)
        }
    }
}
