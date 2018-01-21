import Foundation

extension CookItem
{
    //MARK: private
    
    private func asyncLoadSteps(cloud:Cloud)
    {
        cloud.loadRecipeSteps(recipe:self.recipe)
        { [weak self] (stepList:RecipeStepsList?, error:Error?) in
            
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
            
            self?.steps = steps
        }
    }
    
    //MARK: internal
    
    func loadSteps(cloud:Cloud)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadSteps(cloud:cloud)
        }
    }
}
