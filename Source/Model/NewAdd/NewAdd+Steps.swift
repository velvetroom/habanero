import UIKit

extension NewAdd
{
    //MARK: private
    
    private func validateText(text:String) -> Bool
    {
        guard
        
            text.count > 0
        
        else
        {
            return false
        }
        
        return true
    }
    
    private func asyncCreateStepText(
        text:String,
        completion:@escaping(() -> ()))
    {
        guard
        
            self.validateText(text:text) == true,
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
    
    private func asyncCreateStepImage(
        image:UIImage,
        text:String,
        completion:@escaping(() -> ()))
    {
        guard
        
            self.validateText(text:text) == true,
            let database:Database = self.database,
            let imageIdentifier:String = NewAdd.createIdentifierAndStoreLocally(image:image)
        
        else
        {
            return
        }
        
        database.create
        { [weak self] (step:BuildStepImage) in
            
            step.text = text
            step.imageIdentifier = imageIdentifier
            
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
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCreateStepImage(
                image:image,
                text:text,
                completion:completion)
        }
    }
}
