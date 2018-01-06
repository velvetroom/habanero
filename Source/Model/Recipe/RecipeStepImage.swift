import Foundation

final class RecipeStepImage:RecipeStep
{
    let imageIdentifier:String
    
    required init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let imageIdentifier:String = json[RecipeStep.Keys.imageIdentifier] as? String
            
        else
        {
            return nil
        }
        
        self.imageIdentifier = imageIdentifier
        
        super.init(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
    }
}
