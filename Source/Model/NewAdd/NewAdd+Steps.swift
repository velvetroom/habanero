import UIKit

extension NewAdd
{
    //MARK: private
    
    private func asyncCreateStepText(
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
    
    func createStepText(
        text:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCreateStepText(
                text:text,
                completion:completion)
        }
    }
    
    func createStepImage(
        image:UIImage,
        text:String,
        completion:@escaping(() -> ()))
    {
        
    }
}
