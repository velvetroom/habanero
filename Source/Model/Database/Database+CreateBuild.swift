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
        { [weak self] (ingredientCups:BuildIngredientCups) in
            
            ingredientCups.cups = cups
            
            self?.provider.save
            {
                completion(ingredientCups)
            }
        }
    }
    
    func createBuildIngredientGrams(
        grams:Int32,
        completion:@escaping((BuildIngredientGrams) -> ()))
    {
        self.provider.create
        { [weak self] (ingredientGrams:BuildIngredientGrams) in
            
            ingredientGrams.grams = grams
            
            self?.provider.save
            {
                completion(ingredientGrams)
            }
        }
    }
    
    func createBuildIngredientMililitres(
        mililitres:Int32,
        completion:@escaping((BuildIngredientMililitres) -> ()))
    {
        self.provider.create
        { [weak self] (ingredientMililitres:BuildIngredientMililitres) in
                
            ingredientMililitres.mililitres = mililitres
                
            self?.provider.save
            {
                completion(ingredientMililitres)
            }
        }
    }
    
    func createBuildIngredientQuantity(
        quantity:Float,
        completion:@escaping((BuildIngredientQuantity) -> ()))
    {
        self.provider.create
        { [weak self] (ingredientQuantity:BuildIngredientQuantity) in
            
            ingredientQuantity.quantity = quantity
            
            self?.provider.save
            {
                completion(ingredientQuantity)
            }
        }
    }
    
    func createBuildIngredientSpoons(
        spoons:Int16,
        completion:@escaping((BuildIngredientSpoons) -> ()))
    {
        self.provider.create
        { [weak self] (ingredientSpoons:BuildIngredientSpoons) in
            
            ingredientSpoons.spoons = spoons
            
            self?.provider.save
            {
                completion(ingredientSpoons)
            }
        }
    }
}