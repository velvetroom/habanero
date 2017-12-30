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
            
            self?.infoUpdated(completion:completion)
        }
    }
    
    private func infoUpdated(completion:@escaping(() -> ()))
    {
        self.database?.save
        {
            DispatchQueue.main.async
            {
                completion()
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
    
    func editInfoTitle(
        title:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.build?.title = title
            
            self?.infoUpdated(completion:completion)
        }
    }
    
    func editInfoSubtitle(
        subtitle:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.build?.subtitle = subtitle
            
            self?.infoUpdated(completion:completion)
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
