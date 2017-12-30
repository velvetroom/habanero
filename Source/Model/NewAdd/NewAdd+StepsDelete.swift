import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncDeleteStep(
        step:BuildStep,
        completion:@escaping(() -> ()))
    {
        guard
            
            let database:Database = self.database
        
        else
        {
            return
        }
        
        self.deleteStepContents(step:step)
        
        database.delete(data:step)
        {
            database.save
            { [weak self] in
                
                self?.stepDeleted(completion:completion)
            }
        }
    }
    
    private func stepDeleted(completion:@escaping(() -> ()))
    {
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    func deleteStep(
        step:BuildStep,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncDeleteStep(
                step:step,
                completion:completion)
        }
    }
    
    func deleteStepContents(step:BuildStep)
    {
        
    }
}
