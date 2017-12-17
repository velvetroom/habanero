import Foundation

extension New
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        self.getOrInitDatabaseAndSettings
        { [weak self] (database:Database, settings:Settings) in
            
            self?.settings = settings
            
            database.fetch
            { [weak self] (builds:[Build]) in
                
                self?.buildLoaded(
                    builds:builds,
                    completion:completion)
            }
        }
    }
    
    private func buildLoaded(
        builds:[Build],
        completion:@escaping(() -> ()))
    {
        self.items = NewItem.factoryItems(builds:builds)
        
        DispatchQueue.main.async
        {   
            completion()
        }
    }
    
    private func getOrInitDatabaseAndSettings(completion:@escaping((Database, Settings) -> ()))
    {
        guard
        
            let database:Database = self.database,
            let settings:Settings = self.settings
        
        else
        {
            self.initDatabaseAndSettings(completion:completion)
            
            return
        }
        
        completion(database, settings)
    }
    
    private func initDatabaseAndSettings(completion:@escaping((Database, Settings) -> ()))
    {
        guard
        
            let database:Database = Database(bundle:Bundle.main)
        
        else
        {
            return
        }
        
        database.create
        { (settings:Settings) in
            
            completion(database, settings)
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
