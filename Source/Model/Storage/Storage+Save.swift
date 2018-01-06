import Foundation

extension Storage
{
    private static var stepTypeRouter:[RecipeStepType :
        ((Storage) -> (RecipeStep, BuildStep, Recipe, @escaping((Error?) -> ())) -> ())]
    {
        get
        {
            let map:[RecipeStepType :
                ((Storage) -> (RecipeStep, BuildStep, Recipe, @escaping((Error?) -> ())) -> ())] = [
                RecipeStepType.image : Storage.stepImage]
            
            return map
        }
    }
    
    //MARK: private
    
    private class func dataFor(fileLocation:URL) -> Data?
    {
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:fileLocation,
                options:Data.ReadingOptions.mappedIfSafe)
        }
        catch
        {
            return nil
        }
        
        return data
    }
    
    private func stepImage(
        recipeStep:RecipeStep,
        step:BuildStep,
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let step:BuildStepImage = step as? BuildStepImage,
            let imageIdentifier:String = step.imageIdentifier,
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier),
            let data:Data = Storage.dataFor(fileLocation:imageURL)
            
        else
        {
            return
        }
        
        self.provider.save(
            data:data,
            with:recipeStep.identifier,
            at:recipe.identifier,
            of:StorageContainer.recipeSteps,
            completion:completion)
    }
    
    //MARK: internal
    
    func saveRecipeImage(
        recipe:Recipe,
        build:Build,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let imageIdentifier:String = build.imageIdentifier,
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier),
            let data:Data = Storage.dataFor(fileLocation:imageURL)
        
        else
        {
            return
        }
        
        self.provider.save(
            data:data,
            with:recipe.identifier,
            at:StorageContainer.recipe,
            completion:completion)
    }
    
    func saveRecipeStepAssets(
        recipeStep:RecipeStep,
        step:BuildStep,
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        guard
        
            let router:((Storage) -> (RecipeStep, BuildStep, Recipe, @escaping((Error?) -> ())) -> ()) =
                Storage.stepTypeRouter[step.recipeStepType]
        
        else
        {
            completion(nil)
            
            return
        }
        
        router(self)(
            recipeStep,
            step,
            recipe,
            completion)
    }
}
