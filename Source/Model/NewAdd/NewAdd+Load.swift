import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        guard
        
            let build:Build = self.build
        
        else
        {
            return
        }
        
        self.sections = NewAdd.factorySections(build:build)
        
        DispatchQueue.main.async
        {
            completion()
        }
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
