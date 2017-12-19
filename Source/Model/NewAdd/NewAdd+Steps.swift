import Foundation

extension NewAdd
{
    //MARK: private
    
    private func asyncCreateTextStep(
        text:String,
        completion:@escaping(() -> ()))
    {
        guard
        
            text.count > 0,
            let database:Database = self.database
        
        else
        {
            return
        }
        
        database.create
        { [weak self] (step:BuildStepText) in
            
            step.text = text
            self?.stepCreated(
                step:step,
                database:database,
                completion:completion)
        }
    }
    
    private func stepCreated(
        step:BuildStep,
        database:Database,
        completion:@escaping(() -> ()))
    {
        step.build = self.build
        
        database.save
        {
            DispatchQueue.main.async
            {
                completion()
            }
        }
    }
    
    //MARK: internal
    
    func createTextStep(
        text:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCreateTextStep(
                text:text,
                completion:completion)
        }
    }
}
