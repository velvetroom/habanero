import Foundation

extension RecipeStep
{
    private static var stepTypeForType:[RecipeStepType:RecipeStep.Type]
    {
        get
        {
            let map:[RecipeStepType:RecipeStep.Type] = [
                RecipeStepType.text : RecipeStepText.self,
                RecipeStepType.image : RecipeStepImage.self]
            
            return map
        }
    }
    
    //MARK: internal
    
    class func factoryStepType(json:[String:Any]) -> RecipeStep.Type?
    {
        guard
            
            let rawType:Int16 = json[RecipeStep.Keys.stepType] as? Int16,
            let type:RecipeStepType = RecipeStepType(rawValue:rawType)
            
        else
        {
            return nil
        }
        
        let stepType:RecipeStep.Type? = RecipeStep.stepTypeForType[type]
        
        return stepType
    }
}
