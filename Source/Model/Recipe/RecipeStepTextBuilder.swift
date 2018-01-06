import Foundation

struct RecipeStepTextBuilder:CloudItemBuilderProtocol
{
    var text:String
    var order:Int
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                RecipeStep.Keys.stepType : RecipeStepType.text,
                RecipeStep.Keys.text : self.text,
                RecipeStep.Keys.order : self.order]
            
            return json
        }
    }
    
    init()
    {
        self.text = String()
        self.order = 0
    }
}
