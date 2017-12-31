import Foundation

extension NewAdd
{
    private static var strategies:[NewAddDeleteStrategyProtocol.Type]
    {
        get
        {
            let strategies:[NewAddDeleteStrategyProtocol.Type] = []
            
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
        
        let strategies:[NewAddDeleteStrategyProtocol.Type] = NewAdd.strategies
        
        self.delete(
            build:build,
            database:database,
            strategies:strategies,
            completion:completion)
    }
    
    private func delete(
        build:Build,
        database:Database,
        strategies:[NewAddDeleteStrategyProtocol.Type],
        completion:@escaping(() -> ()))
    {
        var remainStrategies:[NewAddDeleteStrategyProtocol.Type] = strategies
        
        guard
        
            let strategy:NewAddDeleteStrategyProtocol.Type = remainStrategies.popLast()
        
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
