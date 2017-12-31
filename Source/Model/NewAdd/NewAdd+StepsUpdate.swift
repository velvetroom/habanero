import UIKit

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
    
    private func asyncUpdate(
        step:BuildStepImage,
        image:UIImage,
        completion:@escaping(() -> ()))
    {
        guard
        
            let imageIdentifier:String = step.imageIdentifier,
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier)
        
        else
        {
            return
        }
        
        do
        {
            try NewAdd.store(
                image:image,
                at:imageURL)
        }
        catch
        {
            return
        }
        
        DispatchQueue.main.async
        {
            completion()
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
    
    func update(
        step:BuildStepImage,
        image:UIImage,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncUpdate(
                step:step,
                image:image,
                completion:completion)
        }
    }
}
