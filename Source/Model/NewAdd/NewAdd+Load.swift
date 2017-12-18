import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        guard
        
            let build:Build = self.build,
            let settings:Settings = self.settings
        
        else
        {
            return
        }
        
        self.database?.fetch
            { (ingredients:[BuildIngredient]) in
            
                print("total ingredients \(ingredients.count)")
        }
        
        self.sections = NewAdd.factorySections(
            build:build,
            settings:settings)
        
        DispatchQueue.main.async
        {
            completion()
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
