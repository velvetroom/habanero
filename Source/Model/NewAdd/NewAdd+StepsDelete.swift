import Foundation

extension NewAdd
{
    private static var stepDeleteContentsRouter:[RecipeStepType : ((NewAdd) -> (BuildStep) throws -> ())]
    {
        get
        {
            let map:[RecipeStepType : ((NewAdd) -> (BuildStep) throws -> ())] = [
                RecipeStepType.image : NewAdd.deleteStepImageContents]
            
            return map
        }
    }
    
    //MARK: private
    
    private func asyncDeleteStep(
        step:BuildStep,
        completion:@escaping(() -> ()))
    {
        self.deleteStepContents(step:step)
        
        self.database?.deleteBuildStep(
            buildStep:step,
            completion:completion)
    }
    
    private func stepDeleted(completion:@escaping(() -> ()))
    {
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    private func deleteStepImageContents(step:BuildStep) throws
    {
        guard
        
            let step:BuildStepImage = step as? BuildStepImage,
            let imageIdentifier:String = step.imageIdentifier,
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier)
        
        else
        {
            return
        }
        
        try NewAdd.deleteImage(localURL:imageURL)
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
        guard
        
            let router:((NewAdd) -> (BuildStep) throws -> ()) =
            NewAdd.stepDeleteContentsRouter[step.recipeStepType]
        
        else
        {
            return
        }
        
        do
        {
            try router(self)(step)
        }
        catch { }
    }
}
