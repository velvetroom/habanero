import Foundation

extension BuildStep
{
    var recipeStepType:RecipeStepType
    {
        get
        {
            guard
                
                let recipeStepType:RecipeStepType = RecipeStepType(rawValue:self.rawRecipeStepType)
                
            else
            {
                return RecipeStepType.text
            }
            
            return recipeStepType
        }
    }
}
