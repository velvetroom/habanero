import Foundation

extension NewAdd
{
    private static var strategies:[NewAddValidateStrategyProtocol.Type]
    {
        get
        {
            let strategies:[NewAddValidateStrategyProtocol.Type] = [
                NewAddValidateStrategyMinSteps.self,
                NewAddValidateStrategyMinIngredients.self,
                NewAddValidateStrategyTitle.self,
                NewAddValidateStrategySubtitle.self]
            
            return strategies
        }
    }
    
    //MARK: private
    
    private func asyncValidate(completion:@escaping((Error?) -> ()))
    {
        guard
            
            let build:Build = self.build
        
        else
        {
            return
        }
        
        var validationError:Error?
        let strategies:[NewAddValidateStrategyProtocol.Type] = NewAdd.strategies
        
        for strategy:NewAddValidateStrategyProtocol.Type in strategies
        {
            guard
            
                let error:Error = strategy.validate(build:build)
            
            else
            {
                continue
            }
            
            validationError = error
            
            break
        }
        
        self.validateFinished(
            error:validationError,
            completion:completion)
    }
    
    private func validateFinished(
        error:Error?,
        completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(error)
        }
    }
    
    //MARK: internal
    
    func validate(completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncValidate(completion:completion)
        }
    }
}
