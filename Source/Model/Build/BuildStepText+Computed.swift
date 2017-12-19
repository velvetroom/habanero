import Foundation

extension BuildStepText
{
    public override var rawRecipeStepType:Int16
    {
        get
        {
            return RecipeStepType.text.rawValue
        }
        
        set(newValue) { }
    }
}
