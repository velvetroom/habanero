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
            
            item.steps = stepList.items
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
