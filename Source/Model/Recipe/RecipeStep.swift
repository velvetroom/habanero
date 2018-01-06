import Foundation

class RecipeStep:CloudItemProtocol
{
    let identifier:String
    let parentPath:String
    let text:String
    let order:Int
    let stepType:RecipeStepType
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let rawStepType:Int16 = json[RecipeStep.Keys.stepType] as? Int16,
            let stepType:RecipeStepType = RecipeStepType(rawValue:rawStepType),
            let text:String = json[RecipeStep.Keys.text] as? String,
            let order:Int = json[RecipeStep.Keys.order] as? Int
            
        else
        {
            return nil
        }
        
        self.parentPath = parentPath
        self.identifier = identifier
        self.stepType = stepType
        self.text = text
        self.order = order
    }
}
