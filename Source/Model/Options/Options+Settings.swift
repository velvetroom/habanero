import Foundation

extension Options
{
    //MARK: private
    
    private func asyncLoadSettings(completion:@escaping((Settings) -> ()))
    {
        self.database.getSettings
        { [weak self] (settings:Settings?) in
            
            guard
            
                let settings:Settings = settings
            
            else
            {
                return
            }
            
            self?.settingsLoaded(
                settings:settings,
                completion:completion)
        }
    }
    
    private func settingsLoaded(
        settings:Settings,
        completion:@escaping((Settings) -> ()))
    {
        self.settings = settings
        
        DispatchQueue.main.async
        {
            completion(settings)
        }
    }
    
    //MARK: internal
    
    func loadSettings(completion:@escaping((Settings) -> ()))
    {
        if let settings:Settings = self.settings
        {
            completion(settings)
        }
        else
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self] in
                
                self?.asyncLoadSettings(completion:completion)
            }
        }
    }
}
