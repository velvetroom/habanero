import Foundation

struct RecipeStepTextBuilder:CloudItemBuilderProtocol
{
    var text:String
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeStep.Keys.stepType : RecipeStepType.text,
                RecipeStep.Keys.text : self.text]
            
            return json
        }
    }
    
    init()
    {
        self.text = String()
    }
}
