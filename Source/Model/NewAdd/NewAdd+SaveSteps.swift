import Foundation

extension NewAdd
{
    private func saveSteps(
        steps:[BuildStep],
        for recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        
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
