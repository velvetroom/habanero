import Foundation

extension Database
{
    //MARK: internal
    
    func deleteBuild(
        build:Build,
        completion:@escaping(() -> ()))
    {
        self.provider.delete(model:build)
        { [weak self] in
            
            self?.provider.save(completion:completion)
        }
    }
    
    func deleteBuildStep(
        buildStep:BuildStep,
        completion:@escaping(() -> ()))
    {
        self.provider.delete(model:buildStep)
        { [weak self] in
            
            self?.provider.save(completion:completion)
        }
    }
    
    func deleteBuildIngredient(
        buildIngredient:BuildIngredient,
        completion:@escaping(() -> ()))
    {
        buildIngredient.build = nil
        
        self.provider.delete(model:buildIngredient)
        { [weak self] in
            
            self?.provider.save(completion:completion)
        }
    }
}
