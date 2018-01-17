import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadStepsFor(item:HomeItem)
    {
        self.cloud.loadRecipeSteps(recipe:item.recipe)
        { (stepList:RecipeStepsList?, error:Error?) in
            
            guard
            
                error == nil,
                let stepList:RecipeStepsList = stepList
            
            else
            {
                return
            }
            
            let steps:[RecipeStep] = stepList.items.sorted
            { (stepA:RecipeStep, stepB:RecipeStep) -> Bool in
                
                return stepA.order <= stepB.order
            }
            
            item.steps = steps
        }
    }
    
    //MARK: internal
    
    func loadStepsFor(item:HomeItem)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadStepsFor(item:item)
        }
    }
}
