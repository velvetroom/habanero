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
        { (ingredientCups:BuildIngredientCups) in
            
            ingredientCups.cups = cups
            
            completion(ingredientCups)
        }
    }
    
    func createBuildIngredientGrams(
        grams:Int32,
        completion:@escaping((BuildIngredientGrams) -> ()))
    {
        self.provider.create
        { (ingredientGrams:BuildIngredientGrams) in
            
            ingredientGrams.grams = grams
            
            completion(ingredientGrams)
        }
    }
    
    func createBuildIngredientMililitres(
        mililitres:Int32,
        completion:@escaping((BuildIngredientMililitres) -> ()))
    {
        self.provider.create
        { (ingredientMililitres:BuildIngredientMililitres) in
                
            ingredientMililitres.mililitres = mililitres
                
            completion(ingredientMililitres)
        }
    }
    
    func createBuildIngredientQuantity(
        quantity:Float,
        completion:@escaping((BuildIngredientQuantity) -> ()))
    {
        self.provider.create
        { (ingredientQuantity:BuildIngredientQuantity) in
            
            ingredientQuantity.quantity = quantity
            
            completion(ingredientQuantity)
        }
    }
    
    func createBuildIngredientSpoons(
        spoons:Int16,
        completion:@escaping((BuildIngredientSpoons) -> ()))
    {
        self.provider.create
        { (ingredientSpoons:BuildIngredientSpoons) in
            
            ingredientSpoons.spoons = spoons
            
            completion(ingredientSpoons)
        }
    }
    
    func createBuildStepText(
        build:Build,
        text:String,
        completion:@escaping((BuildStepText) -> ()))
    {
        self.provider.create
        { [weak self] (stepText:BuildStepText) in
            
            stepText.build = build
            stepText.text = text
            
            self?.provider.save
            {
                completion(stepText)
            }
        }
    }
    
    func createBuildStepImage(
        build:Build,
        text:String,
        imageIdentifier:String,
        completion:@escaping((BuildStepImage) -> ()))
    {
        self.provider.create
        { [weak self] (stepImage:BuildStepImage) in
            
            stepImage.build = build
            stepImage.text = text
            stepImage.imageIdentifier = imageIdentifier
            
            self?.provider.save
            {
                completion(stepImage)
            }
        }
    }
}
