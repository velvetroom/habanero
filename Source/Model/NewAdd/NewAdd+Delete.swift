import Foundation

extension NewAdd
{
    private static var strategies:[NewAddDeleteStrategy]
    {
        get
        {
            let strategies:[NewAddDeleteStrategy] = []
            
            return strategies
        }
    }
    
    //MARK: private
    
    private func asyncDelete(completion:@escaping(() -> ()))
    {
        guard
            
            let build:Build = self.build,
            let database:Database = self.database
            
        else
        {
            return
        }
        
        let strategies:[NewAddDeleteStrategy] = NewAdd.strategies
        
        self.delete(
            build:build,
            database:database,
            strategies:strategies,
            completion:completion)
    }
    
    private func delete(
        build:Build,
        database:Database,
        strategies:[NewAddDeleteStrategy],
        completion:@escaping(() -> ()))
    {
        var remainStrategies:[NewAddDeleteStrategy] = strategies
        
        guard
        
            let strategy:NewAddDeleteStrategy = remainStrategies.popLast()
        
        else
        {
            self.strategiesDone(completion:completion)
            
            return
        }
        
        strategy.delete(
            build:build,
            database:database)
        { [weak self] in
            
            self?.delete(
                build:build,
                database:database,
                strategies:remainStrategies,
                completion:completion)
        }
    }
    
    private func strategiesDone(completion:@escaping(() -> ()))
    {
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    func delete(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncDelete(completion:completion)
        }
    }
}
