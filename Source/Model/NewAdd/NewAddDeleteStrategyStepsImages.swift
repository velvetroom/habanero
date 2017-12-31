import Foundation

struct NewAddDeleteStrategyStepsImages:NewAddDeleteStrategyProtocol
{
    //MARK: private
    
    private static func deleteImageFor(step:BuildStepImage)
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
            try NewAdd.deleteImage(localURL:imageURL)
        }
        catch { }
    }
    
    //MARK: internal
    
    static func delete(
        build:Build,
        database:Database,
        completion:@escaping (() -> ()))
    {
        guard
            
            let steps:[BuildStep] = build.stepList
        
        else
        {
            return
        }
        
        for step:BuildStep in steps
        {
            guard
            
                let stepImage:BuildStepImage = step as? BuildStepImage
            
            else
            {
                continue
            }
            
            NewAddDeleteStrategyStepsImages.deleteImageFor(step:stepImage)
        }
        
        completion()
    }
}
