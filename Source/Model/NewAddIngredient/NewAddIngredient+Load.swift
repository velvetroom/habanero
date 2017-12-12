import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.loadCompleted(completion:completion)
        }
    }
    
    private func loadCompleted(completion:@escaping(() -> ()))
    {
        
        completion()
    }
    
    //MARK: internal
    
    func load(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad(completion:completion)
        }
    }
}
