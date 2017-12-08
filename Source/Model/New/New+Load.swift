import Foundation

extension New
{
    //MARK: private
    
    private func asyncLoad()
    {
        guard
            
            let database:Database = self.getOrInitDatabase()
            
        else
        {
            return
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
    
    func load()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad()
        }
    }
}
