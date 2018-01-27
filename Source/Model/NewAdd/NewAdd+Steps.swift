import UIKit

extension NewAdd
{
    //MARK: private
    
    private func validateText(text:String) -> Bool
    {
        guard
        
            text.isEmpty == false
        
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
        
            self.validateText(text:text) == true
        
        else
        {
            return
        }
        
        self.database?.createBuildStepText(text:text)
        { [weak self] (step:BuildStepText) in
            
            self?.stepCreated(
                step:step,
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
            let imageIdentifier:String = NewAdd.createIdentifierAndStoreLocally(image:image)
        
        else
        {
            return
        }
        
        self.database?.createBuildStepImage(
            text:text,
            imageIdentifier:imageIdentifier)
        { [weak self] (step:BuildStepImage) in
            
            self?.stepCreated(
                step:step,
                completion:completion)
        }
    }
    
    private func stepCreated(
        step:BuildStep,
        completion:@escaping(() -> ()))
    {
        step.build = self.build
        
        DispatchQueue.main.async
        {
            completion()
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
