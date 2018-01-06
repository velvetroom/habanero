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
                identifier != nil
                
            else
            {
                completion(error)
                
                return
            }
            
            let nextOrder:Int = currentOrder + 1
            
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
