import Foundation

extension BuildStepImage
{
    public override var rawRecipeStepType:Int16
    {
        get
        {
            return RecipeStepType.image.rawValue
        }
        
        set(newValue) { }
    }
}
