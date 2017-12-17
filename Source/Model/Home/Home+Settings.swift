import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadSettings(completion:@escaping(() -> ()))
    {
        guard
        
            let database:Database = Database(bundle:Bundle.main)
        
        else
        {
            return
        }
        
        self.database = database
        
        database.fetch
        { [weak self] (settingsList:[Settings]) in
            
            guard
            
                let settings:Settings = settingsList.first
            
            else
            {
                self?.createSettings(
                    database:database,
                    completion:completion)
                
                return
            }
            
            self?.settingsLoaded(
                settings:settings,
                completion:completion)
        }
    }
    
    private func createSettings(
        database:Database,
        completion:@escaping(() -> ()))
    {
        database.create
        { (settings:Settings) in
            
            database.save
            { [weak self] in
                
                self?.settingsLoaded(
                    settings:settings,
                    completion:completion)
            }
        }
    }
    
    private func settingsLoaded(
        settings:Settings,
        completion:@escaping(() -> ()))
    {
        self.settings = settings
        
        DispatchQueue.main.async
        {
            completion()
        }
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
