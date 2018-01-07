import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadRecipes(completion:@escaping(() -> ()))
    {
        
    }
    
    //MARK: internal
    
    func loadRecipes(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadRecipes(completion:completion)
        }
    }
}
