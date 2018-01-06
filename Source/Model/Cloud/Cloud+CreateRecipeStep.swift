import Foundation

extension Cloud
{
    private static var stepTypeRouter:[RecipeStepType : ((BuildStep, Int) -> ([String:Any]?))]
    {
        get
        {
            let map:[RecipeStepType : ((BuildStep, Int) -> ([String:Any]?))] = [
                RecipeStepType.text : Cloud.stepText,
                RecipeStepType.image : Cloud.stepImage]
            
            return map
        }
    }
    
    //MARK: private
    
    private class func stepText(
        step:BuildStep,
        order:Int) -> [String:Any]?
    {
        guard
            
            let step:BuildStepText = step as? BuildStepText,
            let text:String = step.text
            
        else
        {
            return nil
        }
        
        var builder:RecipeStepTextBuilder = RecipeStepTextBuilder()
        builder.text = text
        builder.order = order
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    private class func stepImage(
        step:BuildStep,
        order:Int) -> [String:Any]?
    {
        guard
            
            let step:BuildStepImage = step as? BuildStepImage,
            let text:String = step.text
            
        else
        {
            return nil
        }
        
        var builder:RecipeStepImageBuilder = RecipeStepImageBuilder()
        builder.text = text
        builder.order = order
        
        let json:[String:Any] = builder.json
        
        return json
    }
    
    //MARK: internal
    
    func createRecipeStep(
        step:BuildStep,
        with order:Int,
        for recipe:Recipe,
        completion:@escaping((String?, Error?) -> ()))
    {
        guard
            
            let router:((BuildStep, Int) -> ([String:Any]?)) = Cloud.stepTypeRouter[step.recipeStepType],
            let json:[String:Any] = router(
                step,
                order)
            
        else
        {
            return
        }
        
        self.provider.createItemAt(
            listKey:Recipe.Keys.steps,
            of:recipe,
            with:json,
            completion:completion)
    }
}
