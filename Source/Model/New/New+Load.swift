import Foundation

extension New
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        guard
            
            let database:Database = self.getOrInitDatabase()
            
        else
        {
            return
        }
        
        database.fetch
        { [weak self] (builds:[Build]) in
            
            self?.buildLoaded(
                builds:builds,
                completion:completion)
        }
    }
    
    private func buildLoaded(
        builds:[Build],
        completion:@escaping(() -> ()))
    {
        self?.builds = builds
        
        DispatchQueue.main.async
        { [weak self] in
            
            completion()
        }
    }
    
    private func getOrInitDatabase() -> Database?
    {
        guard
        
            self.database == nil
        
        else
        {
            return self.database
        }
        
        let database:Database? = Database(bundle:Bundle.main)
        self.database = database
        
        return database
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
