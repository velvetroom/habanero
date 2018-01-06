import Foundation

extension NewAdd
{
    private func saveSteps(
        steps:[BuildStep],
        with currentOrder:Int,
        for recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        var steps:[BuildStep] = steps
        
        guard
        
            let step:BuildStep = steps.popLast()
        
        else
        {
            self.finishedSaving(
                error:nil,
                completion:completion)
            
            return
        }
        
        self.cloud.createRecipeStep(
            step:step,
            with:currentOrder,
            for:recipe)
        { [weak self] (identifier:String?, error:Error?) in
            
            guard
                
                error == nil,
                let identifier:String = identifier
                
            else
            {
                completion(error)
                
                return
            }
            
            self?.stepCreated(
                identifier:identifier,
                step:step,
                steps:steps,
                recipe:recipe,
                completion:completion)
        }
    }
    
    private func stepCreated(
        identifier:String,
        step:BuildStep,
        steps:[BuildStep],
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        self.cloud.loadRecipeStep(
            identifier:identifier,
            from:recipe)
        { [weak self] (recipeStep:RecipeStep?, error:Error?) in
            
            guard
            
                error == nil,
                let recipeStep:RecipeStep = recipeStep
            
            else
            {
                completion(error)
                
                return
            }
            
            self?.saveAssets(
                recipeStep:recipeStep,
                step:step,
                steps:steps,
                recipe:recipe,
                completion:completion)
        }
    }
    
    private func saveAssets(
        recipeStep:RecipeStep,
        step:BuildStep,
        steps:[BuildStep],
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        self.storage.saveRecipeStepAssets(
            recipeStep:recipeStep,
            step:step,
            recipe:recipe)
        { [weak self] (error:Error?) in
            
            guard
            
                error == nil
            
            else
            {
                completion(error)
                
                return
            }
            
            let nextOrder:Int = recipeStep.order + 1
            
            self?.saveSteps(
                steps:steps,
                with:nextOrder,
                for:recipe,
                completion:completion)
        }
    }
    
    //MARK: internal
    
    func saveSteps(
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let steps:[BuildStep] = self.build?.stepList
            
        else
        {
            return
        }
        
        self.saveSteps(
            steps:steps,
            with:0,
            for:recipe,
            completion:completion)
    }
}
