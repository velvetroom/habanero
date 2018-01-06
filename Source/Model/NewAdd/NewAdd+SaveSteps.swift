import Foundation

extension NewAdd
{
    private func saveSteps(
        steps:[BuildStep],
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
        
        
    }
    
    //MARK: internal
    
    func saveSteps(
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let sateps:[BuildStep] = self.build?.stepList
            
        else
        {
            return
        }
        
        self.saveSteps(
            steps:steps,
            for:recipe,
            completion:completion)
    }
}
