import Foundation

extension Database
{
    //MARK: internal
    
    func createBuild(completion:@escaping((Build) -> ()))
    {
        self.provider.create
        { [weak self] (build:Build) in
            
            self?.provider.save
            {
                completion(build)
            }
        }
    }
    
    func createBuildIngredientCups(
        cups:Float,
        completion:@escaping((BuildIngredientCups) -> ()))
    {
        self.provider.create
        { [weak self] (buildIngredientCups:BuildIngredientCups) in
            
            buildIngredientCups.cups = cups
            
            self?.provider.save
            {
                completion(build)
            }
        }
    }
}
