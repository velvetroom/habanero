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
        {
            database.save
            { [weak self] in
                
                self?.buildDeleted(completion:completion)
            }
        }
    }
    
    private func buildDeleted(completion:@escaping(() -> ()))
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
    
    func editInfoTitle(title:String)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.build?.title = title
            self?.database?.save(completion:nil)
        }
    }
    
    func editInfoSubtitle(subtitle:String)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.build?.subtitle = subtitle
            self?.database?.save(completion:nil)
        }
    }
    
    func durationEdited(duration:TimeInterval)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.build?.duration = duration
            self?.database?.save(completion:nil)
        }
    }
}
