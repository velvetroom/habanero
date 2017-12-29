import Foundation

extension NewAdd
{
    private func asyncUpdated(completion:@escaping(() -> ()))
    {
        guard
            
            let database:Database = self.database
        
        else
        {
            return
        }
        
        database.save
        {
            DispatchQueue.main.async
            {
                completion()
            }
        }
    }
    
    //MARK: internal
    
    func update(
        step:BuildStepText,
        text:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            step.text = text
            
            self?.asyncUpdated(completion:completion)
        }
    }
    
    func update(
        step:BuildStepImage,
        text:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            step.text = text
            
            self?.asyncUpdated(completion:completion)
        }
    }
}
