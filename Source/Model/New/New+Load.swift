import Foundation

extension New
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        self.getSettings
        { [weak self] (settings:Settings) in
            
            self?.settings = settings
            
            self?.database.getBuilds
            { [weak self] (builds:[Build]) in
                
                self?.buildsLoaded(
                    builds:builds,
                    completion:completion)
            }
        }
    }
    
    private func buildsLoaded(
        builds:[Build],
        completion:@escaping(() -> ()))
    {
        self.items = NewItem.factoryItems(builds:builds)
        
        DispatchQueue.main.async
        {   
            completion()
        }
    }
    
    private func getSettings(completion:@escaping((Settings) -> ()))
    {
        if let settings:Settings = self.settings
        {
            completion(settings)
        }
        else
        {
            self.database.getSettings
            { (settings:Settings?) in
                
                guard
                
                    let settings:Settings = settings
                
                else
                {
                    return
                }
                
                completion(settings)
            }
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
