import Foundation

extension NewAdd
{
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
        
        database.delete(data:build)
        { [weak self] in
            
            self.database?.save
                {
                    DispatchQueue.main.async
                        {
                            completion()
                    }
            }
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
