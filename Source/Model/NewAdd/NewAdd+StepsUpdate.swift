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
        stepText:BuildStepText,
        text:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            stepText.text = text
            
            self?.asyncUpdated(completion:completion)
        }
    }
}
