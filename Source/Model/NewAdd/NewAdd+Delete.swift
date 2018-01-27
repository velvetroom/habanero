import Foundation

extension NewAdd
{
    private static var strategies:[NewAddDeleteStrategyProtocol.Type]
    {
        get
        {
            let strategies:[NewAddDeleteStrategyProtocol.Type] = [
                NewAddDeleteStrategyBuild.self,
                NewAddDeleteStrategyStepsImages.self,
                NewAddDeleteStrategyInfoImage.self]
            
            return strategies
        }
    }
    
    //MARK: private
    
    private func asyncDelete(completion:@escaping(() -> ()))
    {
        guard
            
            let build:Build = self.build
            
        else
        {
            return
        }
        
        let strategies:[NewAddDeleteStrategyProtocol.Type] = NewAdd.strategies
        
        self.delete(
            build:build,
            strategies:strategies,
            completion:completion)
    }
    
    private func delete(
        build:Build,
        strategies:[NewAddDeleteStrategyProtocol.Type],
        completion:@escaping(() -> ()))
    {
        var remainStrategies:[NewAddDeleteStrategyProtocol.Type] = strategies
        
        guard
        
            let strategy:NewAddDeleteStrategyProtocol.Type = remainStrategies.popLast(),
            let database:Database = self.database
        
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
