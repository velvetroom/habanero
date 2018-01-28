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
        ingredientIdentifier:String,
        name:String,
        cups:Float,
        build:Build,
        completion:@escaping((BuildIngredientCups) -> ()))
    {
        self.provider.create
        { (ingredientCups:BuildIngredientCups) in
            
            ingredientCups.ingredientIdentifier = ingredientIdentifier
            ingredientCups.name = name
            ingredientCups.cups = cups
            ingredientCups.build = build
            
            completion(ingredientCups)
        }
    }
    
    func createBuildIngredientGrams(
        ingredientIdentifier:String,
        name:String,
        grams:Int32,
        build:Build,
        completion:@escaping((BuildIngredientGrams) -> ()))
    {
        self.provider.create
        { (ingredientGrams:BuildIngredientGrams) in
            
            ingredientGrams.ingredientIdentifier = ingredientIdentifier
            ingredientGrams.name = name
            ingredientGrams.grams = grams
            ingredientGrams.build = build
            
            completion(ingredientGrams)
        }
    }
    
    func createBuildIngredientMililitres(
        ingredientIdentifier:String,
        name:String,
        mililitres:Int32,
        build:Build,
        completion:@escaping((BuildIngredientMililitres) -> ()))
    {
        self.provider.create
        { (ingredientMililitres:BuildIngredientMililitres) in
            
            ingredientMililitres.ingredientIdentifier = ingredientIdentifier
            ingredientMililitres.name = name
            ingredientMililitres.mililitres = mililitres
            ingredientMililitres.build = build
            
            completion(ingredientMililitres)
        }
    }
    
    func createBuildIngredientQuantity(
        ingredientIdentifier:String,
        name:String,
        quantity:Float,
        build:Build,
        completion:@escaping((BuildIngredientQuantity) -> ()))
    {
        self.provider.create
        { (ingredientQuantity:BuildIngredientQuantity) in
            
            ingredientQuantity.ingredientIdentifier = ingredientIdentifier
            ingredientQuantity.name = name
            ingredientQuantity.quantity = quantity
            ingredientQuantity.build = build
            
            completion(ingredientQuantity)
        }
    }
    
    func createBuildIngredientSpoons(
        ingredientIdentifier:String,
        name:String,
        spoons:Int16,
        build:Build,
        completion:@escaping((BuildIngredientSpoons) -> ()))
    {
        self.provider.create
        { (ingredientSpoons:BuildIngredientSpoons) in
            
            ingredientSpoons.ingredientIdentifier = ingredientIdentifier
            ingredientSpoons.name = name
            ingredientSpoons.spoons = spoons
            ingredientSpoons.build = build
            
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
